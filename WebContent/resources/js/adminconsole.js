(function() {



  // Get Elements
  const preObject = document.getElementById('object');
  const ulList = document.getElementById('list');
  const firstName = document.getElementById('firstName');
  const lastName = document.getElementById('lastName');
  const id = document.getElementById("student");
  const email = document.getElementById("email");

  // Create References

  const dbRefObject = firebase.database().ref().child('object');
  const dbRefList = dbRefObject.child('hobbies');

  // Sync object changes
  dbRefObject.on('value', snap => {
    var tempCourse = JSON.stringify(snap.val(), null, 3);
    preObject.innerText = tempCourse;



  });

  // Sync list changes
  dbRefList.on('child_added', snap => {

    const li = document.createElement('li');
    li.innerText = snap.val();
    li.id = snap.key;
    ulList.appendChild(li);
  });

  dbRefList.on('child_changed', snap => {

    const liChanged = document.getElementById(snap.key);
    liChanged.innerText = snap.val();

  });

  dbRefList.on('child_removed', snap => {

    const liToRemove = document.getElementById(snap.key);
    liToRemove.remove();
  });

  // Add logout event
  btnLogout.addEventListener('click', e => {
    firebase.auth().signOut();
    window.location = 'http://localhost:8080/Polyservice';


  });

  // Update user submit info event
  btnSubmit.addEventListener('click', e => {
    // Get user info
    // TODO: Check for real valid input
    const fName = firstName.value;
    const lName = lastName.value;


    var user = firebase.auth().currentUser;

    user.updateProfile({
      displayName: (fName + " " + lName)
    }).then(function() {
      // Update successful.
      console.log('Update successful.');

      if (user != null) {
        user.providerData.forEach(function(profile) {
          console.log("Sign-in provider: " + profile.providerId);
          console.log("  Provider-specific UID: " + profile.uid);
          console.log("  Name: " + profile.displayName);
          console.log("  Email: " + profile.email);

          id.value = profile.uid;

          const dbUsersRef = firebase.database().ref().child('users').child(user.uid);

          dbUsersRef.set({

            full_name: (fName + " " + lName),
            date_of_birth: "March 1 2000",
            email: user.email

          });
        });
      }

    }).catch(function(error) {
      // An error happened.
      console.log('Error updating user info!');

    });
  });

  // Add a realtime listener
  firebase.auth().onAuthStateChanged(firebaseUser => {
    if (firebaseUser) {
      console.log(firebaseUser);
      btnLogout.classList.remove('d-none');
      console.log(firebaseUser.uid);
      id.value = firebaseUser.uid;
      email.value = firebaseUser.email;

    } else {
      console.log('not logged in');
      btnLogout.classList.add('d-none');
    }
  });

}());