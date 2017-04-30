package com.br.accommodation.restfull.entity;

import com.br.accommodation.restfull.entity.BillStatus;
import com.br.accommodation.restfull.entity.HotelReservation;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-11-23T20:58:16")
@StaticMetamodel(Bill.class)
public class Bill_ { 

    public static volatile SingularAttribute<Bill, BillStatus> billStatusId;
    public static volatile SingularAttribute<Bill, Integer> id;
    public static volatile SingularAttribute<Bill, HotelReservation> hotelReservationId;

}