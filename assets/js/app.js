// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
import socket from "./socket"

socket.connect();
let channel = socket.channel("room:main", {});

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

window.onload = function(){
    let btnLeft = document.getElementById("btn-left");
    let btnRight = document.getElementById("btn-right");
    let btnUp = document.getElementById("btn-up");
    let btnDown = document.getElementById("btn-down");


    btnLeft.addEventListener("mousedown", function(){
        channel.push('button:press', {message: 'left'});
    })

    btnLeft.addEventListener("mouseup", function(){
        channel.push('button:release', {message: 'left'});
    })

    btnRight.addEventListener("mousedown", function(){
        channel.push('button:press', {message: 'right'});
    })

    btnRight.addEventListener("mouseup", function(){
        channel.push('button:release', {message: 'right'});
    })

    btnUp.addEventListener("mousedown", function(){
        channel.push('button:press', {message: 'up'});
    })

    btnUp.addEventListener("mouseup", function(){
        channel.push('button:release', {message: 'up'});
    })

    btnDown.addEventListener("mousedown", function(){
        channel.push('button:press', {message: 'down'});
    })

    btnDown.addEventListener("mouseup", function(){
        channel.push('button:release', {message: 'down'});
    })
}
