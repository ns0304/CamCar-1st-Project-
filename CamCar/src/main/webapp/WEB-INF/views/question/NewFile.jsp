<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html><html lang="en"><head>
    <meta charset="UTF-8">
    <title>Toggle Content Example</title>
    <style>
        #contentArea {
            display: none; /* Hidden by default */
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
        }
    </style></head><body>
    <button id="buttonA">Button A</button>
    <div id="contentArea">
        <!-- Pre-written content that will be displayed when Button A is clicked -->
        <p>This is the content you wrote in advance. It appears when Button A is clicked.</p>
    </div>
    <button id="buttonB">Button B</button>

    <script>
        document.getElementById('buttonA').addEventListener('click', function() {
            var content = document.getElementById('contentArea');
            if (content.style.display === 'none') {
                content.style.display = 'block'; // Show content
            } else {
                content.style.display = 'none'; // Hide content
            }
        });
    </script>
    </body>
    </html>

