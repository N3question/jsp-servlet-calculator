<%@ page contentType="text/html; charset=UTF-8" %>

<style>
    body {
        margin: 0;
        min-height: 100vh;
        background: #000;
        font-family: -apple-system, BlinkMacSystemFont,
                     "Helvetica Neue", Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .calculator {
        width: 340px;
        padding: 18px;
        box-sizing: border-box;
        background: #000;
        position: relative;
    }

    /* 上部 */
    .top-bar {
        height: 32px;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        margin-bottom: 6px;
    }

    /* 履歴アイコン */
    .history-icon {
        border: none;
        background: transparent;
        color: #aaa;
        font-size: 21px;
        cursor: pointer;
        padding: 4px 6px;
    }

    .history-icon:hover {
        color: #fff;
    }

    /* 計算結果表示 */
    .display {
        width: 100%;
        height: 100px;
        border: none;
        outline: none;
        background: transparent;
        color: #fff;
        font-size: 54px;
        font-weight: 300;
        text-align: right;
        padding: 0 8px;
        margin-bottom: 14px;
        box-sizing: border-box;
    }

    /* ボタン */
    .buttons {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 12px;
    }

    .buttons button {
        width: 68px;
        height: 68px;
        border: none;
        border-radius: 50%;
        font-size: 27px;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* 数字 */
    .number {
        background: #333;
        color: #fff;
    }

    .number:active {
        background: #555;
    }

    /* AC・削除・% */
    .function {
        background: #a5a5a5;
        color: #000;
    }

    .function:active {
        background: #d4d4d4;
    }

    /* 演算子 */
    .operator {
        background: #ff9f0a;
        color: #fff;
    }

    .operator:active {
        background: #fff;
        color: #ff9f0a;
    }

    /* +/- */
    .sign {
        background: #333;
        color: #fff;
    }

    .sign:active {
        background: #555;
    }

    /* エラー表示 */
    .status {
        min-height: 22px;
        margin-top: 10px;
        color: #ff453a;
        font-size: 14px;
        text-align: center;
    }

    /* 履歴 */
    .history-area {
        position: absolute;
        top: 50px;
        left: 18px;
        right: 18px;

        background: #1c1c1e;
        border-radius: 16px;

        padding: 14px;
        box-sizing: border-box;

        z-index: 10;

        max-height: 260px;
        overflow-y: auto;
    }

    .history-header {
        display: flex;
        justify-content: space-between;
        align-items: center;

        color: #fff;
        margin-bottom: 12px;
        font-size: 15px;
    }

    .history-close {
        border: none;
        background: transparent;
        color: #ff9f0a;
        font-size: 14px;
        cursor: pointer;
    }

    .history-list {
        color: #fff;
        font-size: 16px;
    }

    .history-item {
        padding: 10px 0;
        border-bottom: 1px solid #333;
        text-align: right;
    }

    .history-item:last-child {
        border-bottom: none;
    }

    .history-empty {
        color: #888;
        text-align: center;
        padding: 20px 0;
    }
</style>


<div class="calculator">

    <!-- 履歴 -->
    <div class="top-bar">

        <button
            type="button"
            class="history-icon"
            onclick="toggleHistory()"
            aria-label="履歴を表示">
            🕘
        </button>

    </div>


    <!-- 表示欄 -->
    <input
        type="text"
        id="display"
        class="display"
        value=""
        readonly>


    <!-- 電卓ボタン -->
    <div class="buttons">

        <!-- 1段目 -->

        <button
            class="function"
            type="button"
            onclick="clearDisplay()">
            AC
        </button>

        <button
            class="function"
            type="button"
            onclick="deleteLast()">
            ×
        </button>

        <button
            class="function"
            type="button"
            onclick="percentage()">
            %
        </button>

        <button
            class="operator"
            type="button"
            onclick="chooseOperator('/')">
            ÷
        </button>


        <!-- 2段目 -->

        <button
            class="number"
            type="button"
            onclick="inputNumber('7')">
            7
        </button>

        <button
            class="number"
            type="button"
            onclick="inputNumber('8')">
            8
        </button>

        <button
            class="number"
            type="button"
            onclick="inputNumber('9')">
            9
        </button>

        <button
            class="operator"
            type="button"
            onclick="chooseOperator('*')">
            ×
        </button>


        <!-- 3段目 -->

        <button
            class="number"
            type="button"
            onclick="inputNumber('4')">
            4
        </button>

        <button
            class="number"
            type="button"
            onclick="inputNumber('5')">
            5
        </button>

        <button
            class="number"
            type="button"
            onclick="inputNumber('6')">
            6
        </button>

        <button
            class="operator"
            type="button"
            onclick="chooseOperator('-')">
            −
        </button>


        <!-- 4段目 -->

        <button
            class="number"
            type="button"
            onclick="inputNumber('1')">
            1
        </button>

        <button
            class="number"
            type="button"
            onclick="inputNumber('2')">
            2
        </button>

        <button
            class="number"
            type="button"
            onclick="inputNumber('3')">
            3
        </button>

        <button
            class="operator"
            type="button"
            onclick="chooseOperator('+')">
            ＋
        </button>


        <!-- 5段目 -->

        <button
            class="sign"
            type="button"
            onclick="toggleSign()">
            +/−
        </button>

        <button
            class="number"
            type="button"
            onclick="inputNumber('0')">
            0
        </button>

        <button
            class="number"
            type="button"
            onclick="inputDecimal()">
            .
        </button>

        <button
            class="operator"
            type="button"
            onclick="calculate()">
            =
        </button>

    </div>


    <!-- メッセージ -->
    <div
        class="status"
        id="status">
    </div>


    <!-- 履歴表示エリア -->
    <div
        id="historyArea"
        class="history-area"
        style="display: none;">

        <div class="history-header">

            <span>履歴</span>

            <button
                type="button"
                class="history-close"
                onclick="toggleHistory()">
                閉じる
            </button>

        </div>

        <div
            id="historyList"
            class="history-list">

            <div class="history-empty">
                履歴はありません
            </div>

        </div>

    </div>

</div>
