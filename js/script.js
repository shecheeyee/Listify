const wrapper = document.querySelector('.wrapper');
const loginLink = document.querySelector('.login-link');
const registerLink = document.querySelector('.register-link');
const btnPop = document.querySelector('.btnLogin');
const iconClose = document.querySelector('.icon-close');
const welcomeMessage = document.querySelector(".welcome-message");

registerLink.addEventListener('click', () => {
    wrapper.classList.add('active');
});

loginLink.addEventListener('click', () => {
    wrapper.classList.remove('active');
});

btnPop.addEventListener('click', () => {
    wrapper.classList.add('active-popup');
});

iconClose.addEventListener('click', () => {
    wrapper.classList.remove('active-popup');
    welcomeMessage.style.display = "block";
});


btnPop.addEventListener("click", function () {
    welcomeMessage.style.display = "none";
});
