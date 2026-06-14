document.addEventListener('DOMContentLoaded', function () {
    const container = document.getElementById('container');
    const countdown = document.getElementById('countdown');
    const timerLabel = document.getElementById('timer-label');

    function showOverlay(respawnText, color) {
        if (color) {
            document.documentElement.style.setProperty('--main-color', color);
        }
        countdown.textContent = respawnText;
        timerLabel.style.display = 'block'; // Sicherstellen, dass es beim Start da ist
        container.classList.remove('hidden');
    }

    function hideOverlay() {
        container.classList.add('hidden');
    }

    function updateTimer(respawnText, isFinished) {
        countdown.textContent = respawnText;
        if (isFinished) {
            timerLabel.style.display = 'none';
        } else {
            timerLabel.style.display = 'block';
        }
    }

    window.addEventListener('message', function (event) {
        const data = event.data;

        switch (data.type) {
            case 'show':
                showOverlay(data.respawnTime, data.color);
                break;
            case 'hide':
                hideOverlay();
                break;
            case 'updateTimer':
                updateTimer(data.respawnTime, data.isFinished);
                break;
        }
    });
});
