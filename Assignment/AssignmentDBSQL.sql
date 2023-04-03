CREATE TABLE IF NOT EXISTS Role (
    roleId char(3) NOT NULL,
    roleDesc varchar(255) NOT NULL,
    CONSTRAINT role_PK PRIMARY KEY (roleId)
);

CREATE TABLE IF NOT EXISTS Staff(
    staffId char(10) NOT NULL,
    roleId char(3) NOT NULL,
    password varchar(20) NOT NULL,
    CONSTRAINT staff_PK PRIMARY KEY (staffId),
    CONSTRAINT Staff_FK_role FOREIGN KEY (roleId) REFERENCES Role(roleId)
);
CREATE TABLE IF NOT EXISTS imageList (
    imageListId char(10) NOT NULL,
    imageListName varchar(255) Not Null,
    CONSTRAINT imageList_PK PRIMARY KEY (imageListId)
);

CREATE TABLE IF NOT EXISTS image (
    imageId char(10) NOT NULL,
    imageSrc varchar(255) NOT NULL,
    imageListId char(10) NOT NULL,
    CONSTRAINT image_PK PRIMARY KEY (imageId),
    CONSTRAINT image_FK_imageList FOREIGN KEY (imageListId) REFERENCES ImageList(imageListId)
);

CREATE TABLE IF NOT EXISTS Venue (
    venueId char(10) NOT NULL,
    imageListId char(10) NOT NULL,
    venueName varchar(255) NOT NULL,
    venueType varchar(255) NOT NULL,
    venueCapacity varchar(255) NOT NULL,
    venueLocation varchar(255) NOT NULL,
    venueDesc varchar(255) NOT NULL,
    venuePIC char(10) NOT NULL,
    venueHourlyFee int(5) NOT NULL,
    venueStatus char(1) NOT NULL,
    CONSTRAINT Venue_PK PRIMARY KEY (venueId),
    CONSTRAINT venue_FK_Staff FOREIGN KEY (venuePIC) REFERENCES Staff(staffId),
    CONSTRAINT venue_FK_imageList FOREIGN KEY (imageListId) REFERENCES ImageList(imageListId)
);

CREATE TABLE IF NOT EXISTS TimeSlot (
    atimeSlot Time Not Null,
    CONSTRAINT TimeSlot_PK PRIMARY KEY (atimeSlot)

);
CREATE TABLE IF NOT EXISTS DateTable (
    aDate DATE Not Null,
     CONSTRAINT dateTable_PK PRIMARY KEY (aDate)
);

CREATE TABLE IF NOT EXISTS Member (
    memberId char(10) NOT NULL,
    memeberName varchar(255) NOT NULL,
    memberEmail varchar(255) NOT NULL,
    accountStatus char(1) NOT NULL,
    password varchar(20) NOT NULL,
    CONSTRAINT member_PK PRIMARY KEY (memberId)
);


CREATE TABLE IF NOT EXISTS GuestList (
    guestListId char(10) NOT NULL,
    memberId char(10) NOT NULL,
    CONSTRAINT GuestList_PK PRIMARY KEY (guestListId),
    CONSTRAINT GuestList_FK_Member FOREIGN KEY (memberId) REFERENCES Member(memberId)

);
CREATE TABLE IF NOT EXISTS Guest (
    guestId char(10) NOT NULL,
    guestName varchar(255) NOT NULL,
    guestEmail varchar(255) NOT NULL,
    guestListId char(10) NOT NULL,
    CONSTRAINT guest_PK PRIMARY KEY (guestId),
    CONSTRAINT guest_FK_guestList FOREIGN KEY (guestListId) REFERENCES GuestList(guestListId)
);



CREATE TABLE IF NOT EXISTS BookingRequest (
    bookingRequestId char(10) NOT NULL,
    bookDate Date NOT NULL,
    bookVenueId char(10) NOT NULL,
    bookMemberId char(10) NOT NULL,
    bookStartTime Time NOT NULL,
    bookEndTime Time NOT NULL,
    bookStatus char(1) NOT NULL,
    bookRequestTime DateTime NOT NULL,
    bookPaymentReceipt varchar(255),
    bookGuestListId char(10) NOT NULL,
    CONSTRAINT book_PK PRIMARY KEY (bookingRequestId),
    CONSTRAINT book_FK_Venue FOREIGN KEY (bookVenueId) REFERENCES Venue(venueId),
    CONSTRAINT book_FK_Date FOREIGN KEY (bookDate) REFERENCES dateTable(aDate),
    CONSTRAINT book_FK_StartTime FOREIGN KEY (bookStartTime) REFERENCES TimeSlot(atimeSlot),
    CONSTRAINT book_FK_EndTime FOREIGN KEY (bookEndTime) REFERENCES TimeSlot(atimeSlot),
    CONSTRAINT book_FK_guestlist FOREIGN KEY (bookGuestListId) REFERENCES GuestList(guestListid)
);
CREATE TABLE IF NOT EXISTS CheckInOutRecord (
    checkInOutRecordId char(10) NOT NULL,
    bookingRequestId char(10) NOT NULL,
    memberId char(10) NOT NULL,
    checkInOutType char(1) NOT NULL,
    checkInOutTime Time NOT NULL,
    checkInOutRemark varchar(255),
    CONSTRAINT checkInRecord_PK PRIMARY KEY (checkInOutRecordId),
    CONSTRAINT checkInOut_FK_bookRequest FOREIGN KEY (bookingRequestId) REFERENCES BookingRequest(bookingRequestId),
    CONSTRAINT checkInOut_FK_member FOREIGN KEY (memberId) REFERENCES Member(memberId)
);


'''CONSTRAINT NoDoubleBooking CHECK(
         NOT EXISTS(
             SELECT 1 
             FROM BookingRequest b1, BookingRequest b2 
             WHERE b1.bookDate + b1.bookStartTime < b2.bookDate + b2.bookStartTime
             AND b1.BookDate + b1.bookEndTime > b2.BookDate + b2.bookStartTime
);'''


INSERT INTO Role VALUES ('R01', 'normal Staff');
INSERT INTO Role VALUES ('R02', 'administrator');
INSERT INTO Staff VALUES ('S000000001', 'R01', 'hi7you');
INSERT INTO Staff VALUES ('S000000002', 'R02', 'hi8you');
INSERT INTO Staff VALUES ('S000000003', 'R01', 'hi88you');
INSERT INTO Member VALUES ('M000000001', 'ChanTaiMan', 'ChanTaiMan@Email.com', '1', 'hi9you');
INSERT INTO Member VALUES ('M000000002', 'SiuMing', 'SiuMing@Email.com', '2', 'hi0you');
INSERT INTO dateTable VALUES('2023-03-28');
INSERT INTO Timeslot VALUES('09:00:00');
INSERT INTO Timeslot VALUES('10:00:00');
INSERT INTO Timeslot VALUES('11:00:00');
INSERT INTO Timeslot VALUES('12:00:00');
INSERT INTO Timeslot VALUES('13:00:00');
INSERT INTO Timeslot VALUES('14:00:00');
INSERT INTO Timeslot VALUES('15:00:00');
INSERT INTO Timeslot VALUES('16:00:00');
INSERT INTO Timeslot VALUES('17:00:00');
INSERT INTO Timeslot VALUES('18:00:00');
INSERT INTO GuestList VALUES('GL00000001', 'M000000001');
INSERT INTO Guest VALUES('G000000001', 'TaiMing', 'TaiMing@Email.com' , 'GL00000001');
INSERT INTO ImageList Value('IL00000001', 'Venue1imageList');
INSERT INTO ImageList Value('IL00000002', 'Venue2imageList');
INSERT INTO Image Value('I000000001', 'img/venue1/image1.jpg', 'IL00000001');
INSERT INTO Venue VALUES('V000000001', 'IL00000001', 'Tuen Mun Venue' , 'Big', '2500m2', 'Tuen Mun', 'Tuen Mun IVE Hall', 'S000000001', 900, '1');
INSERT INTO Venue VALUES('V000000002', 'IL00000002', 'Lee Wai Lee Venue' , 'Medium', '1500m2', 'Lee Wai Lee', 'Lee Wai Lee IVE Hall', 'S000000002', 700, '1');
INSERT INTO BookingRequest VALUES('B000000001', '2023-03-28', 'V000000001' , 'M000000001', '13:00:00', '14:00:00', '0', CURRENT_TIMESTAMP, NULL, 'GL00000001');
INSERT INTO CheckInOutRecord Value('C000000001', 'B000000001', 'M000000001' ,'0', DATE_FORMAT(NOW(),'%h:%i'), NULL);
INSERT INTO CheckInOutRecord Value('C000000002', 'B000000001', 'M000000001' ,'1', DATE_FORMAT(NOW(),'%h:%i'), NULL);

DROP TABLE CheckInOutRecord;
DROP TABLE BookingRequest;
DROP TABLE Venue;
DROP TABLE Image;
DROP TABLE imageList;
DROP TABLE Guest;
DROP TABLE GuestList;
DROP TABLE TimeSlot;
DROP TABLE DateTable;
DROP TABLE Staff;
DROP TABLE Member;
DROP TABLE Role;