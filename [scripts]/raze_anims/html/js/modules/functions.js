import { fetchNUI } from "./fetch.js";
let settingsStatus = false;

export const changeClass = target => {
    const sidebar = document.getElementsByClassName('sidebar');
    for (let i = 0; i < sidebar.length; i++) {
        sidebar[i].style.color = 'white';
    }
    target.classList.add('pop');
    target.style.color = "var(--accent-bright)";
    setTimeout(() => {
        target.classList.remove('pop');
    }, 500);

    const animsContainer = document.querySelector('.anims-container');
    const settingsContainer = document.querySelector('.settings-container');
    const isSettingsVisible = window.getComputedStyle(settingsContainer).getPropertyValue('display') == 'flex';

    if (target.id != 'settings') {
        settingsStatus = false;
        const allClass = document.getElementsByClassName('anim');

        if (isSettingsVisible) {
            animsContainer.classList.add('fadeIn');
            settingsContainer.classList.add('fadeOut');
            setTimeout(() => {
                animsContainer.style.display = 'flex';
                settingsContainer.style.display = 'none';
                animsContainer.classList.remove('fadeIn');
                settingsContainer.classList.remove('fadeOut');
            }, 300);
        }

        if (target.id != 'home') {
            const showClass = document.getElementsByClassName(target.id);
            for (let i = 0; i < allClass.length; i++) {
                allClass[i].style.display = 'none';
            }
            for (let i = 0; i < showClass.length; i++) {
                showClass[i].style.display = 'flex';
            }
        } else {
            for (let i = 0; i < allClass.length; i++) {
                allClass[i].style.display = 'flex';
            }
        }
    } else {
        settingsStatus = true;
        if (!isSettingsVisible) {
            animsContainer.classList.add('fadeOut');
            settingsContainer.classList.add('fadeIn');
            setTimeout(() => {
                animsContainer.style.display = 'none';
                settingsContainer.style.display = 'flex';
                animsContainer.classList.remove('fadeOut');
                settingsContainer.classList.remove('fadeIn');
            }, 300);
        }
    }
}

export const getStatus = elem => {
    const savedOpts = JSON.parse(localStorage.getItem('animOptions'));
    for (let i = 0; i < savedOpts.length; i++) {
        if (savedOpts[i] == elem.id) {
            savedOpts.splice(i, 1);
            fetchNUI('changeCfg', {type: elem.id, state: true});
            localStorage.setItem('animOptions', JSON.stringify(savedOpts));
            elem.style.backgroundColor = "#000000cc";
            return true;
        }
    }
    savedOpts.push(elem.id);
    fetchNUI('changeCfg', {type: elem.id, state: false});
    localStorage.setItem('animOptions', JSON.stringify(savedOpts));
    elem.style.backgroundColor = "var(--accent-bright)";
    return false;
}

export const setDisplay = animType => {
    let currentDisplay = (animType == 'fadeIn' && 'flex') || 'none'
    if (currentDisplay == 'flex') {
        document.querySelector('.menu-container').style.display = currentDisplay;
        document.querySelector('.anims-container').style.display = currentDisplay;
    }
    document.querySelector('.menu-container').classList.add(animType);
    document.querySelector('.anims-container').classList.add(animType);
    setTimeout(() => {
        if (currentDisplay != 'flex') {
            document.querySelector('.menu-container').style.display = currentDisplay;
            document.querySelector('.anims-container').style.display = currentDisplay;
        }
        document.querySelector('.menu-container').classList.remove(animType);
        document.querySelector('.anims-container').classList.remove(animType);
    }, 300);
}

export const changeInfo = (type, titleM, descM) => {
    const title = document.getElementById('info-title');
    const desc = document.getElementById('info-desc');
    if (type) {
        title.textContent = titleM;
        desc.textContent = descM;
    } else {
        title.textContent = 'Info';
        desc.textContent = 'Display info about certain buttons and icons.'
    }
}