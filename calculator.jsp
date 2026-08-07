<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>電卓</title>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: #e9edf2;
        font-family: Arial, sans-serif;
    }

    .calculator {
        width: 340px;
        padding: 22px;
        background: #1c1c1e;
        border-radius: 32px;
        box-shadow:
            0 20px 45px rgba(0, 0, 0, 0.25),
            inset 0 1px 0 rgba(255, 255, 255, 0.08);
    }

    .title {
        margin: 0 0 14px;
        color: #ffffff;
        text-align: center;
        font-size: 18px;
        font-weight: normal;
        letter-spacing: 2px;
    }

    .display {
        width: 100%;
        height: 100px;
        margin-bottom: 18px;
        padding: 12px 8px;
        border: none;
        outline: none;
        background: transparent;
        color: #ffffff;
        text-align: right;
        font-size: 48px;
        font-weight: 300;
        overflow: hidden;
    }

    .buttons {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 12px;
    }

    button {
        width: 100%;
        aspect-ratio: 1 / 1;
        border: none;
        border-radius: 50%;
        font-size: 25px;
        cursor: pointer;
        transition:
            transform 0.08s ease,
            filter 0.15s ease;
    }

    button:active {
        transform: scale(0.94);
        filter: brightness(1.25);
    }

    .number {
        background: #333336;
        color: #ffffff;
    }

    .function {
        background: #a5a5a5;
        color: #000000;
    }

    .operator {
        background: #ff9f0a;
        color: #ffffff;
        font-size: 30px;
    }

    .zero {
        grid-column: span 2;
        aspect-ratio: auto;
        border-radius: 40px;
        text-align: left;
        padding-left: 28px;
    }

    .status {
        min-height: 20px;
        margin-top: 15px;
        color: #a5a5a5;
        text-align: center;
        font-size: 13px;
    }

    @media (max-width: 400px) {
        .calculator {
            width: 92vw;
        }

        .display {
            font-size: 42px;
        }
    }
</style>
</head>

<body>

<div class="calculator">

    <h1 class="title">CALCULATOR</h1>

    <input
        type="text"
        id="display"
        class="display"
        value=""
        readonly>

    <div class="buttons">

        <button class="function" type="button" onclick="clearDisplay()">
            AC
        </button>

        <button class="function" type="button" onclick="toggleSign()">
            +/−
        </button>

        <button class="function" type="button" onclick="percentage()">
            %
        </button>

        <button class="operator" type="button" onclick="chooseOperator('/')">
            ÷
        </button>

        <button class="number" type="button" onclick="inputNumber('7')">
            7
        </button>

        <button class="number" type="button" onclick="inputNumber('8')">
            8
        </button>

        <button class="number" type="button" onclick="inputNumber('9')">
            9
        </button>

        <button class="operator" type="button" onclick="chooseOperator('*')">
            ×
        </button>

        <button class="number" type="button" onclick="inputNumber('4')">
            4
        </button>

        <button class="number" type="button" onclick="inputNumber('5')">
            5
        </button>

        <button class="number" type="button" onclick="inputNumber('6')">
            6
        </button>

        <button class="operator" type="button" onclick="chooseOperator('-')">
            −
        </button>

        <button class="number" type="button" onclick="inputNumber('1')">
            1
        </button>

        <button class="number" type="button" onclick="inputNumber('2')">
            2
        </button>

        <button class="number" type="button" onclick="inputNumber('3')">
            3
        </button>

        <button class="operator" type="button" onclick="chooseOperator('+')">
            ＋
        </button>

        <button
            class="number zero"
            type="button"
            onclick="inputNumber('0')">
            0
        </button>

        <button class="number" type="button" onclick="inputDecimal()">
            .
        </button>

        <button class="operator" type="button" onclick="calculate()">
            =
        </button>

    </div>

    <div class="status" id="status"></div>

</div>

</body>
</html>
