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
// import socket from "./socket"

window.onload = function(){
    let btnLeft = document.getElementById("btn-left");
    let btnRight = document.getElementById("btn-right");

    /*
        let btnUp = document.getElementById("btn-up");
        let btnDown = document.getElementById("btn-down");
    */

    btnLeft.addEventListener("mousedown", function(){
        console.log("Button btn-left clicked");
    })

    btnLeft.addEventListener("mouseup", function(){
        console.log("Button btn-left unclicked");
    })

    btnRight.addEventListener("mousedown", function(){
        console.log("Button btn-right clicked");
    })

    btnRight.addEventListener("mouseup", function(){
        console.log("Button btn-right unclicked");
    })

    /*
        btnUp.addEventListener("mousedown", function(){
            console.log("Button btn-up clicked");
        })

        btnUp.addEventListener("mouseup", function(){
            console.log("Button btn-up unclicked");
        })

        btnDown.addEventListener("mousedown", function(){
            console.log("Button btn-down clicked");
        })

        btnDown.addEventListener("mouseup", function(){
            console.log("Button btn-down imclicked");
        })
    */
}
