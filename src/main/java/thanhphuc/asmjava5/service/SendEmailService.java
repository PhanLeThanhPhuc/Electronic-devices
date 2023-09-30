package thanhphuc.asmjava5.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

public interface SendEmailService {
	void sendEmail(String email, String idUser) throws UnsupportedEncodingException, MessagingException;
}
