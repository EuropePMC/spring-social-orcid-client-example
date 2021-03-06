<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
</head>
<body>
	<h1>
		Welcome to Spring Social ORCID...
	</h1>

	<form action="<c:url value="/signin/orcid" />" method="POST">
		<button type="submit">Sign in with ORCID</button>
		<input type="hidden" name="scope" id="orcid_scope" value="/authenticate" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
		<input type="checkbox" name="additional_permission" value="/read-limited /activities/update"> Allow for (1) Reading Entire Record and (2) Adding a Research Activity 
	</form>
	
	<form action="<c:url value="/signin/facebook" />" method="POST">
		<button type="submit">Sign in with Facebook</button>
		<input type="hidden" name="scope"
			value="public_profile, user_friends" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
	</form>

	<form id="login--twitter-form" class="login--signin-link" action="<c:url value="/signin/twitter" />" method="POST">
		<input type="hidden" name="force_login" value="false" />
		<button id="login--twitter-signin" class="secondary login--signin-button" onclick="submitTwitterForm()">Sign in with Twitter</button>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
</body>
<script type="text/javascript">
$(document).ready(function() {
    $('input[name="additional_permission"]').change(function() {
        if($(this).is(":checked")) {
            $('#orcid_scope').val($('input[name="additional_permission"]').val());
        } else {
        	$('#orcid_scope').val("/authenticate");
        }
    });
});
</script>
</html>