-- Task 1. Display books with the minimum number of pages issued by a particular publishing house.

SELECT Books.[Name], Books.Pages, Press.[Name] AS Publishers
FROM Books
JOIN Press ON Books.Id_Press = Press.Id
WHERE Books.Pages = (SELECT MIN(Pages) FROM Books WHERE Id_Press = Press.Id);

-- ========================================================================================

-- Task 2. Display the names of publishers who have issued books with an average number of pages larger than 100.

SELECT Press.[Name] AS Publisher
FROM Press
JOIN Books ON Press.Id = Books.Id_Press
GROUP BY Press.Name
HAVING AVG(Books.Pages) > 100;

-- =======================================================================================

-- Task 3. Output the total amount of pages of all the books in the library 
-- issued by the publishing houses BHV and BINOM.


SELECT SUM(Books.Pages) AS TotalPages
FROM Books
JOIN Press ON Books.Id_Press = Press.Id
WHERE Press.[Name] IN ('BHV', 'BINOM');

-- =======================================================================================

-- Task 4. Select the names of all students who took books between January 1, 2001 and the current date.

SELECT Students.FirstName, Students.LastName
FROM Students
JOIN S_Cards ON Students.id = S_Cards.Id_Student
WHERE S_Cards.DateOut BETWEEN '2001-01-01' AND GETDATE();


-- =======================================================================================

-- Task 5. Find all students who are currently working with the book "Windows 2000 Registry" by Olga Kokoreva.

SELECT Students.FirstName, Students.LastName
FROM Students
JOIN S_Cards ON Students.id = S_Cards.Id_Student
JOIN Books ON S_Cards.Id_Book = Books.id
JOIN Authors ON Books.Id_Author = Authors.id
WHERE Books.[Name] = 'Windows 2000 Registry' AND Authors.FirstName = 'Olga' 
AND Authors.LastName = 'Kokoreva' AND S_Cards.DateIn IS NULL;


-- =========================================================================================

-- Task 6. Display information about authors whose average volume of books (in pages) is more than 600 pages.

SELECT Authors.FirstName, Authors.LastName
FROM Authors
JOIN Books ON Authors.id = Books.Id_Author
GROUP BY Authors.Id, Authors.FirstName, Authors.LastName
HAVING AVG(Books.Pages) > 600;

-- ==========================================================================================

-- Task 7.  Display information about publishers, whose total number of pages 
-- of books published by them is more than 700.

SELECT Press.[Name], SUM(Books.Pages) AS TotalPages
FROM Press
JOIN Books ON Press.id = Books.Id_Press
GROUP BY Press.Id, Press.Name
HAVING SUM(Books.Pages) > 700;

-- ===========================================================================================

-- Task 8, 9, 10 yazılmayıb :/

