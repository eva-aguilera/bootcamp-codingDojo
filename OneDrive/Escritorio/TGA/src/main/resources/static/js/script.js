const prevBtn = document.querySelector('.prev-btn');
const nextBtn = document.querySelector('.next-btn');
const carouselItems = document.querySelector('.carousel-items');

let counter = 0;
const itemsCount = document.querySelectorAll('.item').length;

nextBtn.addEventListener('click', () => {
  counter++;
  if (counter > itemsCount - 1) {
    counter = 0;
  }
  carouselItems.style.transform = `translateX(${-counter * 100}%)`;
});

prevBtn.addEventListener('click', () => {
  counter--;
  if (counter < 0) {
    counter = itemsCount - 1;
  }
  carouselItems.style.transform = `translateX(${-counter * 100}%)`;
});



function addComment() {
    const commentInput = document.getElementById('commentInput');
    const commentText = commentInput.value.trim();
    
    if (commentText !== '') {
      const commentsDiv = document.getElementById('comments');
      const newComment = document.createElement('div');
      newComment.classList.add('comment');
  
      // User info
      const userInfo = document.createElement('div');
      userInfo.classList.add('user-info');
      const userAvatar = document.createElement('img');
      userAvatar.src = 'user-avatar.jpg'; // Ruta a la foto del usuario
      userAvatar.alt = 'Foto de Perfil';
      userAvatar.classList.add('user-avatar');
      const userName = document.createTextNode('Usuario'); // Nombre del usuario (puedes obtenerlo de un sistema de autenticación)
      userInfo.appendChild(userAvatar);
      userInfo.appendChild(userName);
      newComment.appendChild(userInfo);
  
      // Comment text
      const commentTextContainer = document.createElement('div');
      commentTextContainer.classList.add('comment-text');
      const commentTextNode = document.createTextNode(commentText);
      commentTextContainer.appendChild(commentTextNode);
      newComment.appendChild(commentTextContainer);
  
      // Comment date
      const commentDate = document.createElement('div');
      commentDate.classList.add('comment-date');
      const currentDate = new Date();
      const formattedDate = currentDate.toLocaleString();
      const commentDateNode = document.createTextNode(formattedDate);
      commentDate.appendChild(commentDateNode);
      newComment.appendChild(commentDate);
  
      commentsDiv.appendChild(newComment);
      commentInput.value = '';
      commentsDiv.scrollTop = commentsDiv.scrollHeight;
    } else {
      alert('Por favor, escribe un comentario válido');
    }
  }
  