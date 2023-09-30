package thanhphuc.asmjava5.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import thanhphuc.asmjava5.been.CookieService;
import thanhphuc.asmjava5.been.ParamService;

import thanhphuc.asmjava5.been.SessionService;
import thanhphuc.asmjava5.dto.Report;
import thanhphuc.asmjava5.entity.User;
import thanhphuc.asmjava5.service.OrderDetailService;
import thanhphuc.asmjava5.service.OrderService;
import thanhphuc.asmjava5.service.SendEmailService;
import thanhphuc.asmjava5.service.UserService;

@Controller
public class UserController {

	@Autowired
	CookieService cookieService;

	@Autowired
	ParamService paramService;

	@Autowired
	SessionService sessionService;

	@Autowired
	UserService userService;

	@Autowired
	OrderService orderService;

	@Autowired
	OrderDetailService orderDetailService;

	@Autowired
	SendEmailService sendEmailService;

	@GetMapping("/formlogin")
	public String formLogin(Model model) {
		model.addAttribute("u", cookieService.getValue("user", ""));
		model.addAttribute("p", cookieService.getValue("pass", ""));
		return "login";
	}

	@PostMapping("/login")
	public String login(Model model) {
		String un = paramService.getString("username", "");
		String pw = paramService.getString("password", "");
		boolean rmb = paramService.getBoolean("remember", false);
		if (userService.findByIdAndPassword(un, pw) == null) {
			cookieService.remove("user");
			cookieService.remove("pass");
//			model.addAttribute(pw);
			model.addAttribute("login", "Sai tài khoản hoặc mật khẩu.");
			return "login";
		} else {
			sessionService.setAttribute("logintc", "Đăng nhập thành công.");
			sessionService.setAttribute("userss", userService.findByIdAndPassword(un, pw));
			if (rmb = true) {
				cookieService.add("user", un, 10);
				cookieService.add("pass", pw, 10);
			}
			return "redirect:/home";
		}
	}

	@GetMapping("/logout")
	public String logout() {
		sessionService.removeAttribute("userss");
		return "redirect:/home";
	}

	@GetMapping("/userinfo")
	public String userInfo(Model model) {
//		model.addAttribute("countCart", cartService.countCart());
		return "user_information";
	}

	@GetMapping("/edituser")
	public String editUser(@ModelAttribute("user") User user) {
		return "edituser";
	}

	@PostMapping("/saveuser")
	public String saveUser(@ModelAttribute("user") User u, @RequestParam("id") String idUser) {
		User user = userService.findById(idUser);
		user.setName(u.getName());
		user.setAddress(u.getAddress());
		user.setEmail(u.getEmail());
		user.setPhone(u.getPhone());
		userService.saveUser(user);
		sessionService.setAttribute("messageUserUpdate", "Cập nhật thông tin thành công.");
		sessionService.setAttribute("userss", user);
		return "redirect:/userinfo";
	}

	@GetMapping("/formregister")
	public String formRegister( User user) {
		return "register";
	}

	@PostMapping("/registersave")
	public String registerSave(User u, Model model) {
		User idUser = userService.findIdUserById(u.getId());
		System.out.println("iD: "+u.getId());
		if (idUser == null) {
			u.setCode("0");
			u.setRole(false);
			u.setActive(false);
			userService.saveUser(u);
			sessionService.setAttribute("register", "Đăng kí tài khoản thành công.");
		} else {
			model.addAttribute("messageUserRegister", "Username đã tồn tại. Vui lòng chọn username khác.");
		}
		return "register";
	}

	@GetMapping("/user-order")
	public String userInformation(Model model) {
		User userSession = sessionService.get("userss");
		if (userSession == null) {
			return "redirect:formlogin";
		} else {
			model.addAttribute("informationOrder", orderService.findByOrderUserId(userSession.getId()));
			return "user_order";
		}
	}

	@GetMapping("/user-order-details")
	public String userOrderDetails(Model model, @RequestParam("idorder") long idOrder) {
		model.addAttribute("detailOrder", orderDetailService.findByOrderDetailIdOrder(idOrder));
		model.addAttribute("Order", orderService.findOrderById(idOrder));
		return "user_order_detail";
	}

	@GetMapping("/form-forgotpassword")
	public String formForgotPassword() {

		return "forgotpassword";
	}

	@PostMapping("/check-forgot")
	public String checkForgot(Model model) throws UnsupportedEncodingException, MessagingException {
		String username = paramService.getString("username", "");
		String email = paramService.getString("email", "");
		System.out.println("Username: " + username);
		User user = userService.findByUserForgotPass(username);
		if (user == null) {
			model.addAttribute("message", "Tài khoản không tồn tại.");
			model.addAttribute("username", username);
			model.addAttribute("email", email);
			return "forgotpassword";
		} else if (!user.getEmail().equals(email)) {
			model.addAttribute("message", "Email không đúng với tài khoản.");
			model.addAttribute("username", username);
			model.addAttribute("email", email);
			return "forgotpassword";
		} else {
			sendEmailService.sendEmail(email, username);
			model.addAttribute("message", "Gửi mail thành công. Vui lòng kiếm tra hòm thư gmail của bạn.");
			return "forgotpassword";
		}
	}

	@GetMapping("/form-resetpassword")
	public String forgotPass(Model model) {
		String token = paramService.getString("token", "");
		User user = userService.findUserByToken(token);
		if (user == null) {
			return "redirect:/home";
		} else {
			if (user.getCode().equals(token) && user.isActive() == true) {
				model.addAttribute("token", token);
				return "forgotpassword2";
			} else {
				return "redirect:/home";
			}
		}
	}

	@PostMapping("/save-resetpassword")
	public String saveResetPassword(Model model) {
		String token = paramService.getString("token", "");
		String password = paramService.getString("password", "");
		String password2 = paramService.getString("password2", "");
		User user = userService.findUserByToken(token);
		if (user == null || user.isActive() == false) {
			return "redirect:/home";
		} else {
			if (!password.equals(password2)) {
				model.addAttribute("message", "Mật khẩu không khớp.");
				model.addAttribute("password", password);
				model.addAttribute("token", token);
				return "forgotpassword2";
			} else {
				userService.saveResetPassword(token, password);
				model.addAttribute("message", "Đặt lại mật khẩu thành công.");
				model.addAttribute("token", "");
				return "redirect:/resetpasssucces";
			}
		}
	}

	@GetMapping("/resetpasssucces")
	public String resetPassSucces() {

		return "resetpasssucces";
	}

	@GetMapping("/noadmin")
	public String noAdmin() {

		return "noadmin";
	}
	
	@GetMapping("/form-change-pass")
	public String formChangePass(Model model) {
		return "changepassword";
	}
	
	@PostMapping("/save-change-pass")
	public String saveChangePass(Model model, @RequestParam("password") String password,
								@RequestParam("passwordnew") String passwordnew,
								@RequestParam("passwordnew2") String passwordnew2) {
		User userss = sessionService.get("userss");
		User user = userService.findIdUserById(userss.getId());
		if(!user.getPassword().equals(password)) {
			model.addAttribute("message","Mật khẩu cũ k khớp");
		}else if(!passwordnew.equals(passwordnew2)){
			model.addAttribute("password",password);
			model.addAttribute("passwordnew",passwordnew);
			model.addAttribute("message","Mật mới không khớp");
		}else {
			userss.setPassword(passwordnew);
			userService.saveUser(userss);
			model.addAttribute("message","Đổi mật khẩu thành công.");
		}
//		Report rp = new Report();
		return "changepassword";
	}
	
//	@GetMapping("/login-gg")
//	public String loginGg() {
//		
//	}
}
