import consumer from "./consumer"

$(document).ready(function() {
  const room = document.getElementById('comment-form').dataset.postId

  function renderComment(comment) {
    const li = `<li class='list-group-item'
      id='comment-${comment.id}'>${comment.content} &nbsp;
      <a class='text-danger' data-remote='true' rel='nofollow'
      data-method='delete' href='/posts/${comment.post_id}/comments/${comment.id}'>
      <i class='fa fa-trash' aria-hidden='true'></i></a></li>`;

    $("#comment-list").prepend(li);
  }

  function deleteComment(content) {
    const li = document.getElementById(`comment-${content.comment_id}`);
    li.remove();
  }

  consumer.subscriptions.create({ channel: "CommentChannel", room: room }, {
    connected() {
      console.log("Connected")
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
      console.log("Disconnected")
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log("Received data")
      console.log(data)

      if (data.content.action === 'add') { renderComment(data.content) }
      else if (data.content.action === 'remove') { deleteComment(data.content)}
      else { console.log("Unknown action") }
    }
  });
})