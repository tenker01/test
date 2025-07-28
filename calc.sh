#!/bin/bash

echo "Простой калькулятор на Bash"

# Запрашиваем у пользователя ввод чисел и операции
read -p "Введите первое число: " num1
read -p "Введите второе число: " num2
read -p "Выберите операцию (+, -, *, /): " operation

# Выполняем вычисления в зависимости от выбранной операции
case $operation in
    "+")
        result=$(echo "$num1 + $num2" | bc -l)
        ;;
    "-")
        result=$(echo "$num1 - $num2" | bc -l)
        ;;
    "*")
        result=$(echo "$num1 * $num2" | bc -l)
        ;;
    "/")
        if [ "$num2" -eq 0 ]; then
            echo "Ошибка: деление на ноль!"
            exit 1
        fi
        result=$(echo "scale=2; $num1 / $num2" | bc -l)
        ;;
    *)
        echo "Неверная операция!"
        exit 1
        ;;
esac

# Выводим результат
echo "Результат: $result"
