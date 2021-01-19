if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function() {
    const ImageList = document.getElementById('new_message')

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div')
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length

      // 表示する画像を生成
      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob)

      // ファイル選択ボタンを生成
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `message_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'message[images][]')
      inputHTML.setAttribute('type', 'file')

      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      ImageList.appendChild(imageElement)

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    }

    document.getElementById('message_image').addEventListener('change', (e) => {
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);

      createImageHTML(blob)

    });
  });
}




$(function(){
  $fileField = $('#file_0')
 
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $('#img_field_0');
 
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

$(function(){
  $fileField = $('#file_1')
 
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $('#img_field_1');
 
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

$(function(){
  $fileField = $('#file_2')
 
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $('#img_field_2');
 
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});