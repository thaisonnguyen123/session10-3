use tsubasa_session10 ;

DELIMITER //
	create trigger BeforeInsertProduct  
    before insert on products
    for each row
    begin
		if new.quantity < 0 
			then signal sqlstate '45000'
				set message_text = 'Không thể thêm mới sản phâm khi quantity < 0';
        end if ;
    end ;
//
DELIMITER ;

INSERT INTO Products (name, quantity)
 VALUES("Iphone 20", -10);
