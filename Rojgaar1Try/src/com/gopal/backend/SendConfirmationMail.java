package com.gopal.backend;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendConfirmationMail 
{
	public static void sendConfirmationMail(String to_email, String subject, String message)
	{
		
		String from_email="gopalsoni0420@gmail.com";
		String mail_password="Gopal@123";
		
		// 1. create an instance of property class
		Properties props = new Properties();
		
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		/* props.put("mail.smtp.starttls.enable", "true"); */
		props.put("mail.smtp.ssl.enable", "true");

		
		Session session = Session.getInstance(props, new Authenticator()
		{
			@Override
			protected PasswordAuthentication getPasswordAuthentication() 
			{
				return new PasswordAuthentication(from_email, mail_password);
			}
		});
		
		try
		{
			MimeMessage mimemsg = new MimeMessage(session);
			mimemsg.setFrom(new InternetAddress(from_email));
			mimemsg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
			mimemsg.setSubject(subject);
			mimemsg.setText(message);
			
			Transport.send(mimemsg);
			System.out.println("Email sent successfully to: " + to_email);
		}
		catch (MessagingException e)
		{
            System.err.println("Error sending email:");
            e.printStackTrace();
        }
		catch (Exception e)
		{
			System.out.println("Error sending email : ");
			e.printStackTrace();
		}
	}
}
