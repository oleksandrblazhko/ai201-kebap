|Опис вхідних умов|Правильний/неправильний <br> клас еквівалентності|Опис значень вхідних даних|
|:-|:-:|:-|
|1) рядок text  має довжину до 2000 символів; <br> 2) рядок phone має формат "+380"; <br> 3) рядок phone має довжину менше 100 символів|Правильний|text = "текст повідомлення" <br> phone = "+380825946164"|
|1) рядок text  має довжину більше 2000 символів; <br> 2) рядок phone має формат "+380"; <br> 3) рядок phone має довжину менше 100 символів|Неправильний|text = "текст повідомлення...(більше 2000 символів)" <br> phone = "+380825946164"|
|1) рядок text  має довжину до 2000 символів; <br> 2) рядок phone не має формат "+380"; <br> 3) рядок phone має довжину менше 100 символів|Неправильний|text = "текст повідомлення" <br> phone = "3808259впфц"|
|1) рядок text  має довжину до 2000 символів; <br> 2)рядок phone має формат "+380"; <br> 3) рядок phone має довжину більше 100 символів|Неправильний|text = "текст повідомлення" <br> phone = "+380825946164...(більше 100 символів)"|
