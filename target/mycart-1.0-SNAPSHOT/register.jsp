

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row mt-3">
                <div class = "col-md-4 offset-md-4">
                    <div class ="card">
                        <%@include file = "components/message.jsp" %>
                        <div class="card-body px-5">

                            <h3 class="text-center my-3">Sign Up Here</h3>
                            <form action="RegistersServlet" method ="post">

                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter here" aria-describedbynaem="emailHelp" >

                                </div>
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name ="user_email" type="email" class="form-control" id="email" placeholder="Enter here" aria-describedbynaem="emailHelp" >

                                </div>
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input name = "user_password" type="password" class="form-control" id="password" placeholder="Enter here" aria-describedbynaem="emailHelp" >

                                </div>
                                <div class="form-group">
                                    <label for="Phone">User Phone</label>
                                    <input name = "user_phone" type="Number" class="form-control" id="Phone" placeholder="Enter here" aria-describedbynaem="emailHelp" >

                                </div>
                                <div class="form-group">
                                    <label for="Phone">User Adresss</label>
                                    <textarea name="user_address" style="height: 200px;" class="form-control"  placeholder="Enter Your Address"></textarea>

                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Register</button>
                                    <button class="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>


    </body>
</html>
