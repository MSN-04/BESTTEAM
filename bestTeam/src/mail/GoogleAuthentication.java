package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator{
PasswordAuthentication passAuth;

public GoogleAuthentication() {
	passAuth = new PasswordAuthentication("sewoong0409","cckdwhijmthnfljw");
}
public PasswordAuthentication getPasswordAuthentication() {
	return passAuth;
}
}
