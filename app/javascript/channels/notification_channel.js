import consumer from "channels/consumer";

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    console.log("connected");
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    console.log("disconnected");
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const videoHtml = `
      <main class="main">
        <div class="video-container">
          <iframe width="560" height="315" src="${data.movie_url}" frameborder="0" allowfullscreen></iframe>
        </div>

        <div class="movie-details">
          <h2>${data.title}</h2>
          <p>Shared by: ${data.user_email}</p>
          <div class="like-dislike">
              <button class="active">Like</button>
              <button>Dislike</button>
          </div>
          <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis libero in justo fermentum, vitae vestibulum nunc volutpat.</p>
        </div>
      </main>
    `;

    const mainContainer = document.querySelector(".main-container");
    mainContainer.insertAdjacentHTML("afterbegin", videoHtml);

    const modal = document.getElementById("new-video-modal");
    const modalVideoInfo = document.getElementById("modal-video-info");
    modalVideoInfo.textContent = `New video shared by ${userEmail}: ${title}`;
    modal.style.display = "block";

    // Close modal when close button is clicked
    const closeModal = document.querySelector(".modal .close");
    closeModal.addEventListener("click", () => {
      modal.style.display = "none";
    });

    // Close modal when clicking outside of it
    window.addEventListener("click", (event) => {
      if (event.target === modal) {
        modal.style.display = "none";
      }
    });
  },
});
