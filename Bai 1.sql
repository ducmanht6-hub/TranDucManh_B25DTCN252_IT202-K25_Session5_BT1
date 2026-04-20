-- Vấn đề nằm ở thứ tự ưu tiên toán tử trong SQL:
-- AND có độ ưu tiên cao hơn OR.
-- Vì vậy câu lệnh hiện tại:
-- WHERE district = 'Quận 1' OR district = 'Quận 3' AND rating > 4.0;

-- được SQL hiểu ngầm là:
-- WHERE district = 'Quận 1' 
-- OR (district = 'Quận 3' AND rating > 4.0);

-- Hệ quả:

-- Tất cả nhà hàng ở Quận 1 đều được lấy ra (không cần biết rating bao nhiêu).
-- Chỉ Quận 3 mới bị áp điều kiện rating > 4.0.
-- Đó chính là lý do Marketing thấy các quán rating thấp ở Quận 1 vẫn xuất hiện.

-- Cách sửa (chuẩn xác)
-- Bạn cần gom điều kiện khu vực lại trước bằng dấu ngoặc:
SELECT restaurant_name, address, rating
FROM Restaurants
WHERE (district = 'Quận 1' OR district = 'Quận 3')
  AND rating > 4.0;

--  Lúc này logic sẽ đúng:

-- Chỉ lấy nhà hàng thuộc Quận 1 hoặc Quận 3
-- Và đồng thời phải có rating > 4.0