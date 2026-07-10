class Ford_dealership;
static int total_cars_sold = 0;
int year;
bit [7:0] vin;

function new (int y, bit [7:0] v);
    year = y;
    vin = v;
    total_cars_sold++;
    $display ("total_cars_sold_ctr=%0d year=%0d vin=%0d", total_cars_sold, year, vin);
endfunction

endclass

module tb;
Ford_dealership car1, car2, car3;
Ford_dealership car[5];

initial begin
car1 = new(2021, 12349876); //calling new function paramaters inside 
car2 = new(2026, 43216789);
car3 = new(2024, 65748392);

foreach (car[i]) begin
  car[i] = new(2000 + i*5, i*300 + 100);
end

end
endmodule
