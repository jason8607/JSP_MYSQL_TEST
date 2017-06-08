<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>

<jsp:useBean id="person" scope="session"
		class="com.jb.PersonData"/>
<jsp:setProperty name="person"
		property="userName" param="tbxName"/>
<jsp:setProperty name="person" property="age"/>
Hi!
<Font color = red>
<jsp:getProperty name="person" property="userName"/>
</Font>
<BR>您的年紀是
<Font color = blue>
<jsp:getProperty name="person" property="age"/>
</Font>歲
