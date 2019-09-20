-- Code by Sydnee Belcher
-- CS312, Section 1
-- Project 7
-- Project Description: use print statements and list operations in Haskell
-- to produce the output given in the project specifications.


list = [1,2,3,4,5]  --constant list

mylist = [1,3,5,6,7,9,10]  --my explicit list for the range

main = do                   -- This column shows the output it's spupposed to give

print list                  --[1,2,3,4,5]
print (head list)           -- 1
print (tail list)           --[2,3,4,5]
print (last (tail list))    -- 5
print (init list)           -- [1,2,3,4]
print (last (init list))    -- 4

print(elem 3 list)          -- True
print(length list)          -- 5
print(null list)            -- False

print(reverse list)         --[5,4,3,2,1]
print(take 2 list)          --[1,2]
print(drop 2 list)          --[3,4,5]

print(minimum list)         -- 1
print(maximum list)         -- 5
print(sum list)             -- 15
print(product list)         -- 120

print(map(^2)list)          --[1,4,9,16,25]

print(all even list)        -- False
print(any odd list)         -- True

print(8:list)               -- [8,1,2,3,4,5]

print(['A'..'Z'])           --"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
print([3*x | x <-mylist])   --[3,9,15,18,21,27,30]
print(replicate 10 0)       --[0,0,0,0,0,0,0,0,0,0]

print("a" ++ "bc")          -- "abc"

print(zip[1,2,3]['a','b','c'])          --[(1,'a'),(2,'b'),(3,'c')]
print(unzip[(1,'a'),(2,'b'),(3,'c')])   --([1,2,3],"abc")

print(words "Hello world")  --["Hello","world"]

