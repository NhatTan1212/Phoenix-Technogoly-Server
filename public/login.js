document.querySelector('.img__btn').addEventListener('click', function () {
  document.querySelector('.cont').classList.toggle('s--signup');
});

function setCookie(cname, cvalue, exdays) {
  const d = new Date();
  d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
  let expires = "expires=" + d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
  let name = cname + "=";
  let decodedCookie = decodeURIComponent(document.cookie);
  let ca = decodedCookie.split(';');
  for (let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}


// document.querySelector('.img__btn').addEventListener('click', function () {
//   document.querySelector('.cont').classList.toggle('s--signup');


// });

const btnSignUp = document.querySelectorAll('button.submit')[1];
// console.log(btnSignUp)
let input = document.querySelectorAll('.sign-up input')
let inputEmail = document.querySelector('.sign-up input[type="email"]');
let signupError = document.querySelectorAll('.signup-error')
let emailInvalid = document.querySelector('.email-invalid')
let emailExists = document.querySelector('.email-exists')

for (let i = 0; i < input.length; i++) {

  // if(input[i].value=='') {
  //   input[i].style.borderBottom = '1px solid red'
  //   signupError[i].style.display = 'block'
  // }
  input[i].oninput = (e) => {
    getInput = e.target.value;
    if (getInput != '') {
      input[i].style.borderBottom = '1px solid rgba(0, 0, 0, 0.4)'
      signupError[i].style.display = 'none'


    }
  }
}

input[1].oninput = (e) => {
  getInput = e.target.value;
  if (getInput != '') {
    input[1].style.borderBottom = '1px solid rgba(0, 0, 0, 0.4)'
    signupError[1].style.display = 'none'
    emailInvalid.style.display = 'none'
    emailExists.style.display = 'none'
  }
}


btnSignUp.onclick = () => {
  let txtName, txtEmail, txtPass;
  txtName = document.querySelector('.sign-up input[type="text"]').value;
  txtEmail = document.querySelector('.sign-up input[type="email"]').value;
  txtPass = document.querySelector('.sign-up input[type="password"]').value;
  let dataUser = {
    name: txtName,
    email: txtEmail,
    pass: txtPass
  }
  if (txtName == '' || txtEmail == '' || txtPass == '') {
    let input = document.querySelectorAll('.sign-up input')
    let signupError = document.querySelectorAll('.signup-error')


    for (let i = 0; i < input.length; i++) {
      input[i].style.borderBottom = '1px solid rgba(0, 0, 0, 0.4)'
      if (input[i].value == '') {
        input[i].style.borderBottom = '1px solid red'
      }

    }

    for (let i = 0; i < signupError.length; i++) {
      signupError[i].style.display = 'none'
      if (input[i].value == '') {
        signupError[i].style.display = 'block'
      }

    }

    if (txtEmail != '') {
      const regexEmail =
        /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
      let isEmailErorr = !regexEmail.test(txtEmail.trim())
      if (isEmailErorr) {
        inputEmail.style.borderBottom = '1px solid red'
        emailInvalid.style.display = 'block'
      }
    }
  } else {
    if (txtEmail != '') {
      const regexEmail =
        /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
      let isEmailErorr = !regexEmail.test(txtEmail.trim())
      if (isEmailErorr) {
        inputEmail.style.borderBottom = '1px solid red'
        emailInvalid.style.display = 'block'
      }
      else {
        fetch('/requireregister', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(dataUser)
        })
          .then(response => response.json())
          .then(data => {
            if (data.emailAlreadyExists == true) {

              emailExists.style.display = 'block'
              inputEmail.style.borderBottom = '1px solid red'
            }
            else {
              emailExists.style.display = 'none'
              alert('Bạn đã tạo tài khoản thành công.')
            }

          })
          .catch(error => {
            console.error('Error:', error);
          });
      }
    }


  }

}

const btnSignIn = document.querySelectorAll('button.submit')[0];
// console.log(btnSignIn)
btnSignIn.onclick = () => {
  let txtEmail, txtPass;
  txtEmail = document.querySelector('.sign-in input[type="email"]').value;
  txtPass = document.querySelector('.sign-in input[type="password"]').value;
  let dataUser = {
    email: txtEmail,
    pass: txtPass
  }
  fetch('/requirelogin', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(dataUser)
  })
    .then(response => response.json())
    .then(data => {
      if (data.success == true) {
        window.location.href = data.redirectUrl;
        console.log(data)
        setCookie('token', data.token, 1)
        document.querySelector('.incorrect-pass').style.display = 'none'

      } else {
        document.querySelector('.incorrect-pass').style.display = 'block'
      }

    })
    .catch(error => {
      console.error('Error:', error);
    });

}


// const allBtnSignInFb = document.querySelectorAll('.fb-btn');
// allBtnSignInFb.forEach(btnSignInFb => {
//   btnSignInFb.onclick = () => {
//     fetch('https://graph.facebook.com/v17.0/me?fields=id%2Cname%2Cemail%2Cpicture%7Burl%7D&access_token=EAAIEkq1Ci8sBAHRPqBEVfTZAAdQy3oIBfh6kB3wzovBGDz3lNRykmAYcUC8oBgdekpJN9ZAuE68ZCxuolYFIsR1QGQVrafJ9Y30LGZAb3fgrSo5tG8HHTp0ZBroRAHE5Na1LnZAqqs33QSyyEKEy7ruZAM57t14TmhHoEewhWAWMIKU0axLQ6ylFvFxnYwho2IZAZACjQTQSLlqgH4lTz19XrzZBHNZA40ZAZAQwZD', {
//       method: 'GET',
//       headers: {
//         'Content-Type': 'application/json',
//       }
//     })
//       .then(response => response.json())
//       .then(data => {
//         console.log(data)

//       })
//       .catch(error => {
//         console.error('Error:', error);
//       });
//   }
// });

