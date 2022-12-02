// const box = document.getElementById("rgba2rgb");
// // box.style.backgroundColor = "rgba(255,0,0)";

// const rgb_background = {
//   r: 0,
//   g: 255,
//   b: 0,
// };

// const rgba_color = {
//   r: 255,
//   g: 0,
//   b: 0,
//   a: 0.5,
// };

// function rgba2rgb(rgb_background, rgba_color) {
//   const alpha = rgba_color.a;
//   let newColor = {
//     r: (1 - alpha) * rgb_background.r + alpha * rgba_color.r,
//     g: (1 - alpha) * rgb_background.g + alpha * rgba_color.g,
//     b: (1 - alpha) * rgb_background.b + alpha * rgba_color.b,
//   };
//   return newColor;
// }

// const toString = (color) => {
//   return "rgb(" + color.r + "," + color.g + "," + color.b + ")";
// };

// const newColor = rgba2rgb(rgb_background, rgba_color);
// box.style.background = toString(newColor);

import data from "./themes/monokai_octagon.json" assert { type: "json" };
console.log(data.colors["editorIndentGuide.background"]);
