<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
 <html lang="en" class="no-js">
    <head>
        <meta charset="UTF-8" />

        <link rel="shortcut icon" href="../favicon.ico">
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style3.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
    </head>
    <body>
        <div class="container1">
            <section>
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login1" class="animate form">
                            <form  action="member.jsp" method="post">
                                <h1>Log in</h1>
                                <p>
                                    <label for="username"  data-icon="u" > Your  username </label>
                                    <input id="username" name="username" required="required" type="text" placeholder="myusername"/>
                                </p>
                                <p>
                                    <label for="password"  data-icon="p"> Your password </label>
                                    <input id="password" name="password" required="required" type="password" placeholder="eg. X8df!90EO" />
                                </p>

                                <p class="login button">
                                    <input type="submit" value="Login" />
								</p>
                                <p class="change_link">
									Not a member yet ?
									<a href="#toregister" class="to_register">Join us</a>
								</p>
                            </form>
                        </div>

                        <div id="register" class="animate form">
                            <form  action="member.jsp" method="post">
                                <h1> Sign up </h1>
                                <p>
                                    <label for="username"  data-icon="u">Your username</label>
                                    <input id="username" name="username" required="required" type="text" placeholder="J8787" />
                                </p>
                                <p>
                                    <label for="password"  data-icon="p">Your password </label>
                                    <input id="password" name="password" required="required" type="password" placeholder="878787"/>
                                </p>
                                <p>
                                    <label for="name"  data-icon="u">Your realname </label>
                                    <input id="name" name="name" required="required" type="text" placeholder="Jason"/>
                                </p>
                                <p>
                                    <label for="email"  data-icon="e" > Your email</label>
                                    <input id="email" name="email" required="required" type="email" placeholder="mysupermail@mail.com"/>
                                </p>
                                <p>
                                    <label for="birth"  data-icon="u">Your birthday </label>
                                    <input id="birth" name="birth" required="required" type="text" placeholder="1990/01/01"/>
                                </p>
                                <p>
                                    <label for="phone" data-icon="u">Your phone number </label>
                                    <input id="phone" name="phone" required="required" type="text" placeholder="0912345678"/>
                                </p>
                                <p class="signin button">
									<input type="submit" value="Sign up"/>
								</p>
                                <p class="change_link">
									Already a member ?
									<a href="#tologin" class="to_register"> Go and log in </a>
								</p>
                            </form>
                        </div>

                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
