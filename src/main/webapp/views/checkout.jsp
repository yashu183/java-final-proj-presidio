<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>checkout.page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
<style>
  .container{
    width : 60%;
    margin : auto;
    Background : #fff;
  }
  .footer{
	padding-bottom : 2rem;
  padding-top : 2rem;
	font-size : 14px;
}
</style>
</head>
<body  style="background-image : url('https://i2.wp.com/storage.googleapis.com/gweb-uniblog-publish-prod/images/Background.2e16d0ba.fill-1422x800.jpg'); width:100%; height: 100vh; background-position:center; background-size : cover; background-attachment: fixed;">
  <div class="container p-3 mt-5 border border-radius shadow">
  <div class="mb-2 text-center">
    <h2>Checkout form</h2>
  </div>

  <div class="row">
    <div class="col-md-12 order-md-1">
      <h4 class="mb-3">Billing address</h4>
      <form class="needs-validation" novalidate>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="firstName">First name</label>
            <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
            <div class="invalid-feedback">
              Valid first name is required.
            </div>
          </div>
          <div class="col-md-6 mb-3">
            <label for="lastName">Last name</label>
            <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
            <div class="invalid-feedback">
              Valid last name is required.
            </div>
          </div>
        </div>

        <div class="mb-3">
          <label for="username">Username</label>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">@</span>
            </div>
            <input type="text" class="form-control" id="username" placeholder="Username" required>
            <div class="invalid-feedback" style="width: 100%;">
              Your username is required.
            </div>
          </div>
        </div>

        <div class="mb-3">
          <label for="email">Email</label>
          <input type="email" class="form-control" id="email" placeholder="you@example.com">
          <div class="invalid-feedback">
            Please enter a valid email address for shipping updates.
          </div>
        </div>

        <div class="mb-3">
          <label for="address">Address</label>
          <input type="text" class="form-control" id="address" placeholder="Enter your address" required>
          <div class="invalid-feedback">
            Please enter your shipping address.
          </div>
        </div>

        <div class="row">
          <div class="col-md-5 mb-3">
            <label for="country">Country</label>
            <input type="text" class="form-control" id="country" placeholder="Enter your country" required>
            <div class="invalid-feedback">
              Please select a valid country.
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <label for="state">State</label>
            <input type="text" class="form-control" id="state" placeholder="Enter your state" required>
            <div class="invalid-feedback">
              Please provide a valid state.
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="zip">Zip</label>
            <input type="text" class="form-control" id="zip" placeholder="" required>
            <div class="invalid-feedback">
              Zip code required.
            </div>
          </div>
        </div>
        <hr class="mb-4">
        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="same-address" onclick = 'fill()'>
          <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
        </div>
        <hr class="mb-4">
        <h4 class="mb-3">Shipping address</h4>
        <div class="mb-3">
          <label for="address">Address</label>
          <input type="text" class="form-control" id="shipaddress" placeholder="Enter your address" required>
          <div class="invalid-feedback">
            Please enter your shipping address.
          </div>
        </div>

        <div class="row">
          <div class="col-md-5 mb-3">
            <label for="country">Country</label>
            <input type="text" class="form-control" id="shipcountry" placeholder="Enter your country" required>
            <div class="invalid-feedback">
              Please select a valid country.
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <label for="state">State</label>
            <input type="text" class="form-control" id="shipstate" placeholder="Enter your state" required>
            <div class="invalid-feedback">
              Please provide a valid state.
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="zip">Zip</label>
            <input type="text" class="form-control" id="shipzip" placeholder="" required>
            <div class="invalid-feedback">
              Zip code required.
            </div>
          </div>
        </div>
        <button onclick = 'fun(event)' style = "float : right;" class="mr-3 btn btn-dark btn-block" type="submit">Continue to checkout</button>
      </form>
    </div>
  </div>
</div>
<%-- <footer style = "font-size : 20px;" class="pb-3 pt-5 text-muted text-center text-small">
  <p>By YashwanthC</p>
</footer> --%>
	<div class = "footer w-100 text-center text-muted"">
		<h5>By YashwanthC</h5>
	</div>
</body>
<script>
function fun(e){
  e.preventDefault();
  const fname = document.getElementById("firstName").value;
  const lname = document.getElementById("lastName").value;
  const uname = document.getElementById("username").value;
  const email = document.getElementById("email").value;
  const address = document.getElementById("address").value;
  const country = document.getElementById("country").value;
  const state = document.getElementById("state").value;
  const zip = document.getElementById("zip").value;
  console.log(fname + lname + uname + email + address + country + state + zip);
}
function fill(){
  const address = document.getElementById("address").value;
  const country = document.getElementById("country").value;
  const state = document.getElementById("state").value;
  const zip = document.getElementById("zip").value;
  document.getElementById("shipaddress").value = address;
  document.getElementById("shipcountry").value = country;
  document.getElementById("shipstate").value = state;
  document.getElementById("shipzip").value = zip;
}
</script>
</html>


