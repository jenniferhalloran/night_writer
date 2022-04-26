## Night Writer
##### Turing Mod1 Final Project
<br>

**Run Night Writer with the below syntax:** <br>
```$ ruby ./lib/night_writer.rb message.txt braille.txt```
<br><br>

**Run Night Reader with the below syntax:** <br>
```ruby ./lib/night_writer.rb message.txt braille.txt```

<p>
On this project I tried to focus on readability, testability and not overcomplicating my design. I have used inheritance to dry up my translator classes - chose a translator parent class because it perfectly answers "is a?" and drys up the code. I also used a module to dry up my night_writer and night_reader classes. I chose to keep these as classes rather than just turning them into runners. As for testing, I tried to make it easier by having many of my methods take arguments. This allowed me to easily create input to test but I did mock and stub a file in my night_writer and night_reader specs.
<br>
I ran out of time to complete any of iteration 4, but would like to come back to it.
</p>
