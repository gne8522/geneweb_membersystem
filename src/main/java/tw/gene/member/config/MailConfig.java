package tw.gene.member.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {

	private final String EMAIL_HOST = "smtp.gmail.com";
	private final int EMAIL_PORT = 587;
	private final String EMAIL_USERNAME = "gne8522@gmail.com";
	private final String EMAIL_PASSWORD = "pfaxfwlodufhohjq";

	@Bean
	public JavaMailSender javaMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost(EMAIL_HOST);
		mailSender.setPort(EMAIL_PORT);
		mailSender.setUsername(EMAIL_USERNAME);
		mailSender.setPassword(EMAIL_PASSWORD);

		Properties props = mailSender.getJavaMailProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

		return mailSender;
	}
}
