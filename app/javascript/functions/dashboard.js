// function check_empty() {
// if (document.getElementById('name').value == "" || document.getElementById('email').value == "" || document.getElementById('msg').value == "") {
// alert("Fill All Fields !");
// } else {
// document.getElementById('form').submit();
// alert("Form Submitted Successfully...");
// }
// }
//Function To Display Popup


// function div_show() {
//   console.log('yoooo this is running!! div_show')
//   document.getElementById('abc').style.display = "block";
// }
// //Function to Hide Popup
// function div_hide(){
// document.getElementById('abc').style.display = "none";
// }




// const romain = document.getElementById("romain");
// romain.addEventListener("click", (event) => {
//   console.log(event);
//   console.log(event.currentTarget);
//     document.getElementById('abc').style.display = "block";
// });



// export { check_empty, div_show, div_hide };






// $('.form').find('input, textarea').on('keyup blur focus', function (e) {

//   var $this = $(this),
//       label = $this.prev('label');

//     if (e.type === 'keyup') {
//       if ($this.val() === '') {
//           label.removeClass('active highlight');
//         } else {
//           label.addClass('active highlight');
//         }
//     } else if (e.type === 'blur') {
//       if( $this.val() === '' ) {
//         label.removeClass('active highlight');
//       } else {
//         label.removeClass('highlight');
//       }
//     } else if (e.type === 'focus') {

//       if( $this.val() === '' ) {
//         label.removeClass('highlight');
//       }
//       else if( $this.val() !== '' ) {
//         label.addClass('highlight');
//       }
//     }

// });

// $('.tab a').on('click', function (e) {

//   e.preventDefault();

//   $(this).parent().addClass('active');
//   $(this).parent().siblings().removeClass('active');

//   target = $(this).attr('href');

//   $('.tab-content > div').not(target).hide();

//   $(target).fadeIn(600);

// });
