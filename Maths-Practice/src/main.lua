function love.load()
    love.window.setMode(480, 480);

    cursorIndex = 1;

    randomNum1MaxDigits = 3;
    randomNum2MaxDigits = 3;

    randomNum1 = math.random(0, (10^(randomNum1MaxDigits)) );
    randomNum2 = math.random(0, (10^(randomNum2MaxDigits)) );

    maxCursorIndex = 3;

    showAnswer = false;

    equationMethod = 1;
end

function love.update()
    if equationMethod == 1 then
        answer = randomNum1 * randomNum2;
    elseif equationMethod == 2 then
        answer = randomNum1 + randomNum2;
    elseif equationMethod == 3 then
        answer = randomNum1 - randomNum2;
    else
        answer = 1;
    end
end

function love.draw()
    love.graphics.print("1st Random Number:", 15, 0);
    love.graphics.print(randomNum1, 150, 0);

    love.graphics.print("Max Digits:", 300, 0);
    love.graphics.print(randomNum1MaxDigits, 375, 0);

    love.graphics.print("2nd Random Number:", 15, 15);
    love.graphics.print(randomNum2, 150, 15);

    love.graphics.print("Max Digits:", 300, 15);
    love.graphics.print(randomNum2MaxDigits, 375, 15);

    love.graphics.print("Equation Method:", 15, 30);
    if equationMethod == 1 then
        love.graphics.print("multiplication", 125, 30);
    elseif equationMethod == 2 then
        love.graphics.print("addition", 125, 30);
    elseif equationMethod == 3 then
        love.graphics.print("subtraction", 125, 30);
    end

    love.graphics.print(">", 0, (cursorIndex * 15) - 15);

    love.graphics.print("Answer:", 0, 45);

    if showAnswer == true then
        love.graphics.print(answer, 50, 45);
    end

    love.graphics.print("Press R to randomise a number!", 0, 75);
    love.graphics.print("Press A for answer!", 0, 90);
    love.graphics.print("Press Left/Right to change equation method or change max digits", 0, 105);
end

function love.keypressed(key)
    if key == "r" then
        if cursorIndex == 1 then
            randomNum1 = math.random(0, (10^(randomNum1MaxDigits)) );
        elseif cursorIndex == 2 then
            randomNum2 = math.random(0, (10^(randomNum2MaxDigits)) );
        end
    elseif key == "up" and cursorIndex > 1 then
        cursorIndex = cursorIndex - 1;
    elseif key == "down" and cursorIndex < maxCursorIndex then
        cursorIndex = cursorIndex + 1;
    end

    if key == "right" then
        if cursorIndex == 3 then
            if equationMethod < 3 then
                equationMethod = equationMethod + 1;
            end
        elseif cursorIndex == 1 then
            randomNum1MaxDigits = randomNum1MaxDigits + 1;
        elseif cursorIndex == 2 then
            randomNum2MaxDigits = randomNum2MaxDigits + 1;
        end
    elseif key == "left" then
        if cursorIndex == 3 then
            if equationMethod > 1 then
                equationMethod = equationMethod - 1;
            end
        elseif cursorIndex == 1 and randomNum1MaxDigits > 1 then
            randomNum1MaxDigits = randomNum1MaxDigits - 1;
        elseif cursorIndex == 2  and randomNum2MaxDigits > 1 then
            randomNum2MaxDigits = randomNum2MaxDigits - 1;
        end
    end

    if key == "a" then
        showAnswer = not showAnswer;
    end
end