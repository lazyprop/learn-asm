all: $(TARGET)

$(TARGET): $(TARGET).s
	as $(TARGET).s -o $(TARGET).o
	ld $(TARGET).o -o $(TARGET)

run: $(TARGET)
	./$(TARGET)

clean:
	rm *.o
