-- Title: 3-Topping Pizzas
-- Company: McKinsey
-- Difficulty: Hard
-- Access: Free
-- Pattern: combinatorics + self-joins
-- Summary: Generate all unique 3-topping pizza combinations and compute their total cost, ensuring no duplicate permutations.
-- Notes: Use 3-way self-join with ordering constraint (t1 < t2 < t3) to avoid duplicates; format toppings consistently.
-- Dialect: PostgreSQL

SELECT 
  CONCAT(p1.topping_name, ',', p2.topping_name, ',', p3.topping_name) AS pizza,
  p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost AS total_cost
FROM pizza_toppings AS p1
INNER JOIN pizza_toppings AS p2
  ON p1.topping_name < p2.topping_name 
INNER JOIN pizza_toppings AS p3
  ON p2.topping_name < p3.topping_name 
ORDER BY total_cost DESC, pizza;