function submit() {
  const submit = document.getElementById("submit-item-review");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("item-review-form"));
    const XHR = new XMLHttpRequest();
    const id = document.getElementById("id-data")
    const itemId = id.getAttribute("item-id")
    XHR.open("POST", `/items/${itemId}/reviews`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.post;
      const list = document.getElementById("item-review-list");
      const formTitle = document.getElementById("item-title");
      const formContent = document.getElementById("item-content");
      const userNickname = document.getElementById("user-name")
      const nickname = userNickname.getAttribute("nickname-data")
      const HTML = `
        <div class="col-sm-10 mb-3">
          <div class="card">
            <div class="card-body text-dark">
              <h5 class="card-title">タイトル：${item.title}</h5>
              <p class="card-text">本文：${item.content}</p>
              <p class="card-text">${nickname}さんが投稿</p>
            </div>
          </div>
        </div>`;
      list.insertAdjacentHTML("afterbegin", HTML);
      formTitle.value = "";
      formContent.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener("load", submit);