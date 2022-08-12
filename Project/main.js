// Ham-menu func
const menu = document.querySelector('.ham-men')
const close = document.querySelector('.close')
const nav = document.querySelector('nav')

    menu.addEventListener('click', () => {
        nav.classList.add('open-nav');
    })
    close.addEventListener('click', () => {
        nav.classList.remove('open-nav');
    })
 


