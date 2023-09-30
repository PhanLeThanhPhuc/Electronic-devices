package thanhphuc.asmjava5.service.serviceImpl;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import net.bytebuddy.utility.RandomString;
import thanhphuc.asmjava5.been.ParamService;
import thanhphuc.asmjava5.entity.User;
import thanhphuc.asmjava5.repository.UserRepository;
import thanhphuc.asmjava5.service.SendEmailService;

@Service
public class SendEmailServiceImpl implements SendEmailService {

	@Autowired
	JavaMailSender mailer;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	ParamService paramService;

	@Override
	public void sendEmail(String email,  String idUser) throws UnsupportedEncodingException, MessagingException {
		
		String token = RandomString.make(30);
		
		String link = paramService.getURL()+"/form-resetpassword?token="+token;
		
		User user = userRepository.findByUserForgotPass(idUser);
		
		user.setCode(token);
		
		user.setActive(true);
		
		System.out.println(token);
		
		userRepository.save(user);
		
		System.out.println(paramService.getURL());

		MimeMessage message = mailer.createMimeMessage();

		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setFrom("shop@gmail.com", "Lấy lại mật khẩu");
		helper.setTo(email);

		String subject = "Lấy lại mật khẩu";

		String content = "<p>Hello,</p>" + "<p>Bạn có yêu cầu lấy lại mật khẩu.</p>"
				+ "<p>Vui lòng bấm vào link để đặt lại mật khẩu.</p>" + "<p>"+ link
				+ "\">Nhấn vào đây</a></p>" + "<br>" + "<p>Vui lòng bảo mật thư này!!!</p>";

		helper.setSubject(subject);

		helper.setText(content, true);

		mailer.send(message);
		
	}

}
