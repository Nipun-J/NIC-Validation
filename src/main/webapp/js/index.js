$('#login-button').on('click', function() {
    $('#login-button').fadeOut("slow", function() {
        $("#container").fadeIn();
    });
});

$(".close-btn").click(function() {
    $("#container").fadeOut(800, function() {
        $("#login-button").fadeIn(800);
    });
});

// Validation
// $(function() {
//     $('#login-form').validate({
//         rules: {
//             email: {
//                 required: true,
//                 email: true
//             },
//             pass: {
//                 required: true
//             }
//         },
//         messages: {
//             email: {
//                 required: "This field is required",
//                 email: "Please enter a valid email address"
//             },
//             pass: {
//                 required: "This field is required"
//             }
//         },
//         submitHandler: function(form) {
//             form.submit();
//         }
//     });
// });


