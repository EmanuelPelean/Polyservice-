(function() {
  
  // Get Elements

  const txtEmail = document.getElementById('txtEmail');
  const txtPassword = document.getElementById('txtPassword');
  const btnLogin = document.getElementById('btnLogin');
  const btnSignUp = document.getElementById('btnSignUp');
  const btnLogout = document.getElementById('btnLogout');
  
  // Add login event
  btnLogin.addEventListener('click', e => {
	  // Get email and pass
	  const email = txtEmail.value;
	  const pass = txtPassword.value;
	  const auth = firebase.auth();
	  
	  // Sign in
	  const promise = auth.signInWithEmailAndPassword(email, pass);
	  promise.catch(e => console.log(e.message));
  });
  
  // Add sign up event
  btnSignUp.addEventListener('click', e => {
	  // Get email and pass
	  // TODO: Check for real email
	  const email = txtEmail.value;
	  const pass = txtPassword.value;
	  const auth = firebase.auth();
	  
	  
	  // Sign in
	  const promise = auth.createUserWithEmailAndPassword(email, pass);
	  promise.catch(e => console.log(e.message));
  });
  
  // Add logout event
  btnLogout.addEventListener('click', e => {
	 firebase.auth().signOut();
	 
  });
  
  // Add a realtime listener
  firebase.auth().onAuthStateChanged(firebaseUser => {
	 if(firebaseUser) {
		 btnLogout.classList.remove('d-none');
		 btnLogin.classList.add('d-none');
		 btnSignUp.classList.add('d-none');
		 txtEmail.classList.add('d-none');
		 txtPassword.classList.add('d-none');
		 
// window.location = 'http://localhost:8080/Polyservice/registration';
		 
	 } else {
		 console.log('not logged in');
		 btnLogout.classList.add('d-none');
		 btnLogin.classList.remove('d-none');
		 btnSignUp.classList.remove('d-none');
		 txtEmail.classList.remove('d-none');
		 txtPassword.classList.remove('d-none');
		 id.value = "logged out";
	 } 
  });
  
  }());

function initMap() {
	var polyservice = {
		lat : 42.609039,
		lng : -83.03248050000002
	};
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom : 17,
		center : polyservice
	});
	
	var marker = new google.maps.Marker({
		position : polyservice,
		map : map
		
	});
}
