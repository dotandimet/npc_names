#!/usr/bin/env perl

use strict;
use warnings;
use 5.016;
use List::Util qw(shuffle);

my @surnames = qw(
Smith Johnson Williams Jones Brown Davis Miller Wilson Moore Taylor Anderson
Thomas Jackson White Harris Martin Thompson Garcia Martinez Robinson Clark
Rodriguez Lewis Lee Walker Hall Allen Young Hernandez King Wright Lopez Hill
Scott Green Adams Baker Gonzalez Nelson Carter Mitchell Perez Roberts Turner
Phillips Campbell Parker Evans Edwards Collins Stewart Sanchez Morris Rogers
Reed Cook Morgan Bell Murphy Bailey Rivera Cooper Richardson Cox Howard Ward
Torres Peterson Gray Ramirez James Watson Brooks Kelly Sanders Price Bennett
Wood Barnes Ross Henderson Coleman Jenkins Perry Powell Long Patterson Hughes
Flores Washington Butler Simmons Foster Gonzales Bryant Alexander Russell
Griffin Diaz Hayes Myers Ford Hamilton Graham Sullivan Wallace Woods Cole West
Jordan Owens Reynolds Fisher Ellis Harrison Gibson Mcdonald Cruz Marshall Ortiz
Gomez Murray Freeman Wells Webb Simpson Stevens Tucker Porter Hunter Hicks
Crawford Henry Boyd Mason Morales Kennedy Warren Dixon Ramos Reyes Burns Gordon
Shaw Holmes Rice Robertson Hunt Black Daniels Palmer Mills Nichols Grant Knight
Ferguson Rose Stone Hawkins Dunn Perkins Hudson Spencer Gardner Stephens Payne
Pierce Berry Matthews Arnold Wagner Willis Ray Watkins Olson Carroll Duncan
Snyder Hart Cunningham Bradley Lane Andrews Ruiz Harper Fox Riley Armstrong
Carpenter Weaver Greene Lawrence Elliott Chavez Sims Austin Peters Kelley
Franklin Lawson Fields Gutierrez Ryan Schmidt Carr Vasquez Castillo Wheeler
Chapman Oliver Montgomery Richards Williamson Johnston Banks Meyer Bishop Mccoy
Howell Alvarez Morrison Hansen Fernandez Garza Harvey Little Burton Stanley
Nguyen George Jacobs Reid Kim Fuller Lynch Dean Gilbert Garrett Romero Welch
Larson Frazier Burke Hanson Day Mendoza Moreno Bowman Medina Fowler Brewer
Hoffman Carlson Silva Pearson Holland Douglas Fleming Jensen Vargas Byrd
Davidson Hopkins May Terry Herrera Wade Soto Walters Curtis Neal Caldwell Lowe
Jennings Barnett Graves Jimenez Horton Shelton Barrett Obrien Castro Sutton
Gregory Mckinney Lucas Miles Craig Rodriquez Chambers Holt Lambert Fletcher
Watts Bates Hale Rhodes Pena Beck Newman Haynes Mcdaniel Mendez Bush Vaughn
Parks Dawson Santiago Norris Hardy Love Steele Curry Powers Schultz Barker
Guzman Page Munoz Ball Keller Chandler Weber Leonard Walsh Lyons Ramsey Wolfe
Schneider Mullins Benson Sharp Bowen Daniel Barber Cummings Hines Baldwin
Griffith Valdez Hubbard Salazar Reeves Warner Stevenson Burgess Santos Tate
Cross Garner Mann Mack Moss Thornton Dennis Mcgee Farmer Delgado Aguilar Vega
Glover Manning Cohen Harmon Rodgers Robbins Newton Todd Blair Higgins Ingram
Reese Cannon Strickland Townsend Potter Goodwin Walton Rowe Hampton Ortega
Patton Swanson Joseph Francis Goodman Maldonado Yates Becker Erickson Hodges
Rios Conner Adkins Webster Norman Malone Hammond Flowers Cobb Moody Quinn Blake
Maxwell Pope Floyd Osborne Paul Mccarthy Guerrero Lindsey Estrada Sandoval Gibbs
Tyler Gross Fitzgerald Stokes Doyle Sherman Saunders Wise Colon Gill Alvarado
Greer Padilla Simon Waters Nunez Ballard Schwartz Mcbride Houston Christensen
Klein Pratt Briggs Parsons Mclaughlin Zimmerman French Buchanan Moran Copeland
Roy Pittman Brady Mccormick Holloway Brock Poole Frank Logan Owen Bass Marsh
Drake Wong Jefferson Park Morton Abbott Sparks Patrick Norton Huff Clayton
Massey Lloyd Figueroa Carson Bowers Roberson Barton Tran Lamb Harrington Casey
Boone Cortez Clarke Mathis Singleton Wilkins Cain Bryan Underwood Hogan Mckenzie
Collier Luna Phelps Mcguire Allison Bridges Wilkerson Nash Summers Atkins Wilcox
Pitts Conley Marquez Burnett Richard Cochran Chase Davenport Hood Gates Clay
Ayala Sawyer Roman Vazquez Dickerson Hodge Acosta Flynn Espinoza Nicholson
Monroe Wolf Morrow Kirk Randall Anthony Whitaker Oconnor Skinner Ware Molina
Kirby Huffman Bradford Charles Gilmore Dominguez Oneal Bruce Lang Combs Kramer
Heath Hancock Gallagher Gaines Shaffer Short Wiggins Mathews Mcclain Fischer
Wall Small Melton Hensley Bond Dyer Cameron Grimes Contreras Christian Wyatt
Baxter Snow Mosley Shepherd Larsen Hoover Beasley Glenn Petersen Whitehead
Meyers Keith Garrison Vincent Shields Horn Savage Olsen Schroeder Hartman
Woodard Mueller Kemp Deleon Booth Patel Calhoun Wiley Eaton Cline Navarro
Harrell Lester Humphrey Parrish Duran Hutchinson Hess Dorsey Bullock Robles
Beard Dalton Avila Vance Rich Blackwell York Johns Blankenship Trevino Salinas
Campos Pruitt Moses Callahan Golden Montoya Hardin Guerra Mcdowell Carey
Stafford Gallegos Henson Wilkinson Booker Merritt Miranda Atkinson Orr Decker
Hobbs Preston Tanner Knox Pacheco Stephenson Glass Rojas Serrano Marks Hickman
English Sweeney Strong Prince Mcclure Conway Walter Roth Maynard Farrell Lowery
Hurst Nixon Weiss Trujillo Ellison Sloan Juarez Winters Mclean Randolph Leon
Boyer Villarreal Mccall Gentry Carrillo Kent Ayers Lara Shannon Sexton Pace Hull
Leblanc Browning Velasquez Leach Chang House Sellers Herring Noble Foley
Bartlett Mercado Landry Durham Walls Barr Mckee Bauer Rivers Everett Bradshaw
Pugh Velez Rush Estes Dodson Morse Sheppard Weeks Camacho Bean Barron Livingston
Middleton Spears Branch Blevins Chen Kerr Mcconnell Hatfield Harding Ashley
Solis Herman Frost Giles Blackburn William Pennington Woodward Finley Mcintosh
Koch Best Solomon Mccullough Dudley Nolan Blanchard Rivas Brennan Mejia Kane
Benton Joyce Buckley Haley Valentine Maddox Russo Mcknight Buck Moon Mcmillan
Crosby Berg Dotson Mays Roach Church Chan Richmond Meadows Faulkner Oneill Knapp
Kline Barry Ochoa Jacobson Gay Avery Hendricks Horne Shepard Hebert Cherry
Cardenas Mcintyre Whitney Waller Holman Donaldson Cantu Terrell Morin Gillespie
Fuentes Tillman Sanford Bentley Peck Key Salas Rollins Gamble Dickson Battle
Santana Cabrera Cervantes Howe Hinton Hurley Spence Zamora Yang Mcneil Suarez
Case Petty Gould Mcfarland Sampson Carver Bray Rosario Macdonald Stout Hester
Melendez Dillon Farley Hopper Galloway Potts Bernard Joyner Stein Aguirre Osborn
Mercer Bender Franco Rowland Sykes Benjamin Travis Pickett Crane Sears Mayo
Dunlap Hayden Wilder Mckay Coffey Mccarty Ewing Cooley Vaughan Bonner Cotton
Holder Stark Ferrell Cantrell Fulton Lynn Lott Calderon Rosa Pollard Hooper
Burch Mullen Fry Riddle Levy David Duke Odonnell Guy Michael Britt Frederick
Daugherty Berger Dillard Alston Jarvis Frye Riggs Chaney Odom Duffy Fitzpatrick
Valenzuela Merrill Mayer Alford Mcpherson Acevedo Donovan Barrera Albert Cote
Reilly Compton Raymond Mooney Mcgowan Craft Cleveland Clemons Wynn Nielsen Baird
Stanton Snider Rosales Bright Witt Stuart Hays Holden Rutledge Kinney Clements
Castaneda Slater Hahn Emerson Conrad Burks Delaney Pate Lancaster Sweet Justice
Tyson Sharpe Whitfield Talley Macias Irwin Burris Ratliff Mccray Madden Kaufman
Beach Goff Cash Bolton Mcfadden Levine Good Byers Kirkland Kidd Workman Carney
Dale Mcleod Holcomb England Finch Head Burt Hendrix Sosa Haney Franks Sargent
Nieves Downs Rasmussen Bird Hewitt Lindsay Le Foreman Valencia Oneil Delacruz
Vinson Dejesus Hyde Forbes Gilliam Guthrie Wooten Huber Barlow Boyle Mcmahon
Buckner Rocha Puckett Langley Knowles Cooke Velazquez Whitley Noel Vang
);


my @boy_names = qw(Liam Noah William James Oliver Benjamin Elijah Lucas Mason Logan
Alexander Ethan Jacob Michael Daniel Henry Jackson Sebastian Aiden Matthew
Samuel David Joseph Carter Owen Wyatt John Jack Luke Jayden Dylan Grayson Levi
Isaac Gabriel Julian Mateo Anthony Jaxon Lincoln Joshua Christopher Andrew
Theodore Caleb Ryan Asher Nathan Thomas Leo Isaiah Charles Josiah Hudson
Christian Hunter Connor Eli Ezra Aaron Landon Adrian Jonathan Nolan Jeremiah
Easton Elias Colton Cameron Carson Robert Angel Maverick Nicholas Dominic Jaxson
Greyson Adam Ian Austin Santiago Jordan Cooper Brayden Roman Evan Ezekiel Xavier
Jose Jace Jameson Leonardo Bryson Axel Everett Parker Kayden Miles Sawyer Jason
Declan Weston Micah Ayden Wesley Luca Vincent Damian Zachary Silas Gavin Chase
Kai Emmett Harrison Nathaniel Kingston Cole Tyler Bennett Bentley Ryker Tristan
Brandon Kevin Luis George Ashton Rowan Braxton Ryder Gael Ivan Diego Maxwell Max
Carlos Kaiden Juan Maddox Justin Waylon Calvin Giovanni Jonah Abel Jayce Jesus
Amir King Beau Camden Alex Jasper Malachi Brody Jude Blake Emmanuel Eric Brooks
Elliot Antonio Abraham Timothy Finn Rhett Elliott Edward August Xander Alan Dean
Lorenzo Bryce Karter Victor Milo Miguel Hayden Graham Grant Zion Tucker Jesse
Zayden Joel Richard Patrick Emiliano Avery Nicolas Brantley Dawson Myles Matteo
River Steven Thiago Zane Matias Judah Messiah Jeremy Preston Oscar Kaleb
Alejandro Marcus Mark Peter Maximus Barrett Jax Andres Holden Legend Charlie
Knox Kaden Paxton Kyrie Kyle Griffin Josue Kenneth Beckett Enzo Adriel Arthur
Felix Bryan Lukas Paul Brian Colt Caden Leon Archer Omar Israel Aidan Theo
Javier Remington Jaden Bradley Emilio Colin Riley Cayden Phoenix Clayton Simon
Ace Nash Derek Rafael Zander Brady Jorge Jake Louis Damien Karson Walker
Maximiliano Amari Sean Chance Walter Martin Finley Andre Tobias Cash Corbin Arlo
Iker Erick Emerson Gunner Cody Stephen Francisco Killian Dallas Reid Manuel Lane
Atlas Rylan Jensen Ronan Beckham Daxton Anderson Kameron Raymond Orion Cristian
Tanner Kyler Jett Cohen Ricardo Spencer Gideon Ali Fernando Jaiden Titus Travis
Bodhi Eduardo Dante Ellis Prince Kane Luka Kash Hendrix Desmond Donovan Mario
Atticus Cruz Garrett Hector Angelo Jeffrey Edwin Cesar Zayn Devin Conor Warren
Odin Jayceon Romeo Julius Jaylen Hayes Kayson Muhammad Jaxton Joaquin Caiden
Dakota Major Keegan Sergio Marshall Johnny Kade Edgar Leonel Ismael Marco Tyson
Wade Collin Troy Nasir Conner Adonis Jared Rory Andy Jase Lennox Shane Malik Ari
Reed Seth Clark Erik Lawson Trevor Gage Nico Malakai Quinn Cade Johnathan
Sullivan Solomon Cyrus Fabian Pedro Frank Shawn Malcolm Khalil Nehemiah Dalton
Mathias Jay Ibrahim Peyton Winston Kason Zayne Noel Princeton Matthias Gregory
Sterling Dominick Elian Grady Russell Finnegan Ruben Gianni Porter Kendrick
Leland Pablo Allen Hugo Raiden Kolton Remy Ezequiel Damon Emanuel Zaiden Otto
Bowen Marcos Abram Kasen Franklin Royce Jonas Sage Philip Esteban Drake Kashton
Roberto Harvey Alexis Kian Jamison Maximilian Adan Milan Phillip Albert Dax
Mohamed Ronin Kamden Hank Memphis Oakley Augustus Drew Moises Armani Rhys Benson
Jayson Kyson Braylen Corey Gunnar Omari Alonzo Landen Armando Derrick Dexter
Enrique Bruce Nikolai Francis Rocco Kairo Royal Zachariah Arjun Deacon Skyler
Eden Alijah Rowen Pierce Uriel Ronald Luciano Tate Frederick Kieran Lawrence
Moses Rodrigo Brycen Leonidas Nixon Keith Chandler Case Davis Asa Darius Isaias
Aden Jaime Landyn Raul Niko Trenton Apollo Cairo Izaiah Scott Dorian Julio
Wilder Santino Dustin Donald Raphael Saul Taylor Ayaan Duke Ryland Tatum Ahmed
Moshe Edison Emmitt Cannon Alec Danny Keaton Roy Conrad Roland Quentin Lewis
Samson Brock Kylan Cason Ahmad Jalen Nikolas Braylon Kamari Dennis Callum
Justice Soren Rayan Aarav Gerardo Ares Brendan Jamari Kaison Yusuf Issac Jasiah
Callen Forrest Makai Crew Kobe Bo Julien Mathew Braden Johan Marvin Zaid Stetson
Casey Ty Ariel Tony Zain Callan Cullen Sincere Uriah Dillon Kannon Colby Axton
Cassius Quinton Mekhi Reece Alessandro Jerry Mauricio Sam Trey Mohammad Alberto
Gustavo Arturo Fletcher Marcelo Abdiel Hamza Alfredo Chris Finnley Curtis Kellan
Quincy Kase Harry Kyree Wilson Cayson Hezekiah Kohen Neil Mohammed Raylan Kaysen
Lucca Sylas Mack Leonard Lionel Ford Roger Rex Alden Boston Colson Briggs Zeke
Dariel Kingsley Valentino Jamir Salvador Vihaan Mitchell Lance Lucian Darren
Jimmy Alvin Amos Tripp Zaire Layton Reese Casen Colten Brennan Korbin Sonny
Bruno Orlando Devon Huxley Boone Maurice Nelson Douglas Randy Gary Lennon Titan
Denver Jaziel Noe Jefferson Ricky Lochlan Rayden Bryant Langston Lachlan Clay
Abdullah Lee Baylor Leandro Ben Kareem Layne Joe Crosby Deandre Demetrius Kellen
Carl Jakob Ridge Bronson Jedidiah Rohan Larry Stanley Tomas Shiloh Thaddeus
Watson Baker Vicente Koda Jagger Nathanael Carmelo Shepherd Graysen Melvin
Ernesto Jamie Yosef Clyde Eddie Tristen GreyRay Tommy Samir Ramon Santana
Kristian Marcel Wells Zyaire Brecken Byron Otis Reyansh Axl Joey Trace Morgan
Musa Harlan Enoch Henrik Kristopher Talon Rey Guillermo Houston Jon Vincenzo
Dane Terry Azariah Castiel Kye Augustine Zechariah Joziah Kamryn Hassan Jamal
Chaim Bodie Emery Branson Jaxtyn Kole Wayne Aryan Alonso Brixton Madden Allan
Flynn Jaxen Harley Magnus Sutton Dash Anders Westley Brett Emory Felipe Yousef
Jadiel Mordechai Dominik Junior Eliseo Fisher Harold Jaxxon Kamdyn Maximo
Caspian Kelvin Damari Fox Trent Hugh Briar Franco Keanu Terrance Yahir Ameer
Kaiser Thatcher Ishaan Koa Merrick Coen Rodney Brayan London Rudy Gordon Bobby
Aron Marc Van Anakin Canaan Dario Reginald Westin Darian Ledger Leighton Maxton
Tadeo Valentin Aldo Khalid Nickolas Toby Dayton Jacoby Billy Gatlin Elisha
Jabari Jermaine Alvaro Marlon Mayson Blaze Jeffery Kace Braydon Achilles Brysen
Saint Xzavier Aydin Eugene Adrien Cain Kylo Nova Onyx Arian Bjorn Jerome Miller
Alfred Kenzo Kyng Leroy Maison Jordy Stefan Wallace Benicio Kendall Zayd Blaine
Tristian Anson Gannon Jeremias Marley Ronnie Dangelo Kody Will Bentlee Gerald
Salvatore Turner Chad Misael Mustafa Konnor Maxim Rogelio Zakai Cory Judson
Brentley Darwin Louie Ulises Dakari Rocky Wesson Alfonso Payton Dwayne Juelz
Duncan Keagan Deshawn Bode Bridger Skylar Brodie Landry Avi Keenan Reuben Jaxx
Rene Yehuda Imran Yael Alexzander Willie Cristiano Heath Lyric Davion Elon
Karsyn Krew Jairo Maddux Ephraim Ignacio Vivaan Aries Vance Boden Lyle Ralph
Reign Camilo Draven Terrence Idris Ira Javion Jericho Khari Marcellus Creed
Shepard Terrell Ahmir Camdyn Cedric Howard Jad Zahir Harper Justus Forest Gibson
Zev Alaric Decker Ernest Jesiah Torin Benedict Bowie Deangelo Genesis Harlem
Kalel Kylen Bishop Immanuel Lian Zavier Archie Davian Gus Kabir Korbyn Randall
Benton Coleman Markus);

my @girl_names = qw(Emma Olivia Ava Isabella Sophia Charlotte Mia Amelia Harper
Evelyn Abigail Emily Elizabeth Mila Ella Avery Sofia Camila Aria Scarlett
Victoria Madison Luna Grace Chloe Penelope Layla Riley Zoey Nora Lily Eleanor
Hannah Lillian Addison Aubrey Ellie Stella Natalie Zoe Leah Hazel Violet Aurora
Savannah Audrey Brooklyn Bella Claire Skylar Lucy Paisley Everly Anna Caroline
Nova Genesis Emilia Kennedy Samantha Maya Willow Kinsley Naomi Aaliyah Elena
Sarah Ariana Allison Gabriella Alice Madelyn Cora Ruby Eva Serenity Autumn
Adeline Hailey Gianna Valentina Isla Eliana Quinn Nevaeh Ivy Sadie Piper Lydia
Alexa Josephine Emery Julia Delilah Arianna Vivian Kaylee Sophie Brielle
Madeline Peyton Rylee Clara Hadley Melanie Mackenzie Reagan Adalynn Liliana
Aubree Jade Katherine Isabelle Natalia Raelynn Maria Athena Ximena Arya Leilani
Taylor Faith Rose Kylie Alexandra Mary Margaret Lyla Ashley Amaya Eliza Brianna
Bailey Andrea Khloe Jasmine Melody Iris Isabel Norah Annabelle Valeria Emerson
Adalyn Ryleigh Eden Emersyn Anastasia Kayla Alyssa Juliana Charlie Esther Ariel
Cecilia Valerie Alina Molly Reese Aliyah Lilly Parker Finley Morgan Sydney
Jordyn Eloise Trinity Daisy Kimberly Lauren Genevieve Sara Arabella Harmony
Elise Remi Teagan Alexis London Sloane Laila Lucia Diana Juliette Sienna Elliana
Londyn Ayla Callie Gracie Josie Amara Jocelyn Daniela Everleigh Mya Rachel
Summer Alana Brooke Alaina Mckenzie Catherine Amy Presley Journee Rosalie Ember
Brynlee Rowan Joanna Paige Rebecca Ana Sawyer Mariah Nicole Brooklynn Payton
Marley Fiona Georgia Lila Harley Adelyn Alivia Noelle Gemma Vanessa Journey
Makayla Angelina Adaline Catalina Alayna Julianna Leila Lola Adriana June Juliet
Jayla River Tessa Lia Dakota Delaney Selena Blakely Ada Camille Zara Malia Hope
Samara Vera Mckenna Briella Izabella Hayden Raegan Michelle Angela Ruth Freya
Kamila Vivienne Aspen Olive Kendall Elaina Thea Kali Destiny Amiyah Evangeline
Cali Blake Elsie Juniper Alexandria Myla Ariella Kate Mariana Lilah Charlee
Daleyza Nyla Jane Maggie Zuri Aniyah Lucille Leia Melissa Adelaide Amina Giselle
Lena Camilla Miriam Millie Brynn Gabrielle Sage Annie Logan Lilliana Haven
Jessica Kaia Magnolia Amira Adelynn Makenzie Stephanie Nina Phoebe Arielle Evie
Lyric Alessandra Gabriela Paislee Raelyn Madilyn Paris Makenna Kinley Gracelyn
Talia Maeve Rylie Kiara Evelynn Brinley Jacqueline Laura Gracelynn Lexi Ariah
Fatima Jennifer Kehlani Alani Ariyah Luciana Allie Heidi Maci Phoenix Felicity
Joy Kenzie Veronica Margot Addilyn Lana Cassidy Remington Saylor Ryan Keira
Harlow Miranda Angel Amanda Daniella Royalty Gwendolyn Ophelia Heaven Jordan
Madeleine Esmeralda Kira Miracle Elle Amari Danielle Daphne Willa Haley Gia
Kaitlyn Oakley Kailani Winter Alicia Serena Nadia Aviana Demi Jada Braelynn
Dylan Ainsley Alison Camryn Avianna Bianca Skyler Scarlet Maddison Nylah Sarai
Regina Dahlia Nayeli Raven Helen Adrianna Averie Skye Kelsey Tatum Kensley
Maliyah Erin Viviana Jenna Anaya Carolina Shelby Sabrina Mikayla Annalise
Octavia Lennon Blair Carmen Yaretzi Kennedi Mabel Zariah Kyla Christina Selah
Celeste Eve Mckinley Milani Frances Jimena Kylee Leighton Katie Aitana Kayleigh
Sierra Kathryn Rosemary Jolene Alondra Elisa Helena Charleigh Hallie Lainey Avah
Jazlyn Kamryn Mira Cheyenne Francesca Antonella Wren Chelsea Amber Emory Lorelei
Nia Abby April Emelia Carter Aylin Cataleya Bethany Marlee Carly Kaylani Emely
Liana Madelynn Cadence Matilda Sylvia Myra Fernanda Oaklyn Elianna Hattie Dayana
Kendra Maisie Malaysia Kara Katelyn Maia Celine Cameron Renata Jayleen Charli
Emmalyn Holly Azalea Leona Alejandra Bristol Collins Imani Meadow Alexia Edith
Kaydence Leslie Lilith Kora Aisha Meredith Danna Wynter Emberly Julieta Michaela
Alayah Jemma Reign Colette Kaliyah Elliott Johanna Remy Sutton Emmy Virginia
Briana Oaklynn Adelina Everlee Megan Angelica Justice Mariam Khaleesi Macie
Karsyn Alanna Aleah Mae Mallory Esme Skyla Madilynn Charley Allyson Hanna Shiloh
Henley Macy Maryam Ivanna Ashlynn Lorelai Amora Ashlyn Sasha Baylee Beatrice
Itzel Priscilla Marie Jayda Liberty Rory Alessia Alaia Janelle Kalani Gloria
Sloan Dorothy Greta Julie Zahra Savanna Annabella Poppy Amalia Zaylee Cecelia
Coraline Kimber Emmie Anne Karina Kassidy Kynlee Monroe Anahi Jaliyah Jazmin
Maren Monica Siena Marilyn Reyna Kyra Lilian Jamie Melany Alaya Ariya Kelly
Rosie Adley Dream Jaylah Laurel Jazmine Mina Karla Bailee Aubrie Katalina Melina
Harlee Elliot Hayley Elaine Karen Dallas Irene Lylah Ivory Chaya Rosa Aleena
Braelyn Nola Alma Leyla Pearl Addyson Roselyn Lacey Lennox Reina Aurelia Noa
Janiyah Jessie Madisyn Saige Alia Tiana Astrid Cassandra Kyleigh Romina Stevie
Haylee Zelda Lillie Aileen Brylee Eileen Yara Ensley Lauryn Giuliana Livia Anya
Mikaela Palmer Lyra Mara Marina Kailey Liv Clementine Kenna Briar Emerie Galilea
Tiffany Bonnie Elyse Cynthia Frida Kinslee Tatiana Joelle Armani Jolie Nalani
Rayna Yareli Meghan Rebekah Addilynn Faye Zariyah Lea Aliza Julissa Lilyana
Anika Kairi Aniya Noemi Angie Crystal Bridget Ari Davina Amelie Amirah Annika
Elora Xiomara Linda Hana Laney Mercy Hadassah Madalyn Louisa Simone Kori Jillian
Alena Malaya Miley Milan Sariyah Malani Clarissa Nala Princess Amani Analia
Estella Milana Aya Chana Jayde Tenley Zaria Itzayana Penny Ailani Lara Aubriella
Clare Lina Rhea Bria Thalia Keyla Haisley Ryann Addisyn Amaia Chanel Ellen
Harmoni Aliana Tinsley Landry Paisleigh Lexie Myah Rylan Deborah Emilee Laylah
Novalee Ellis Emmeline Avalynn Hadlee Legacy Braylee Elisabeth Kaylie Ansley
Dior Paula Belen Corinne Maleah Martha Teresa Salma Louise Averi Lilianna Amiya
Milena Royal Aubrielle Calliope Frankie Natasha Kamilah Meilani Raina Amayah
Lailah Rayne Zaniyah Isabela Nathalie Miah Opal Kenia Azariah Hunter Tori Andi
Keily Leanna Scarlette Jaelyn Saoirse Selene Dalary Lindsey Marianna Ramona
Estelle Giovanna Holland Nancy Emmalynn Mylah Rosalee Sariah Zoie Blaire Lyanna
Maxine Anais Dana Judith Kiera Jaelynn Noor Kai Adalee Oaklee Amaris Jaycee
Belle Carolyn Della Karter Sky Treasure Vienna Jewel Rivka Rosalyn Alannah
Ellianna Sunny Claudia Cara Hailee Estrella Harleigh Zhavia Alianna Brittany
Jaylene Journi Marissa Mavis Iliana Jurnee Aislinn Alyson Elsa Kamiyah Kiana
Lisa Arlette Kadence Kathleen Halle Erika Sylvie Adele Erica Veda Whitney Bexley
Emmaline Guadalupe August Brynleigh Gwen Promise Alisson India Madalynn Paloma
Patricia Samira Aliya Casey Jazlynn Paulina Dulce Kallie Perla Adrienne Alora
Nataly Ayleen Christine Kaiya Ariadne Karlee Barbara Lillianna Raquel Saniyah
Yamileth Arely Celia Heavenly Kaylin Marisol Marleigh Avalyn Berkley Kataleya
Zainab Dani Egypt Joyce Kenley Annabel Kaelyn Etta Hadleigh Joselyn Luella
Jaylee Zola Alisha Ezra Queen Amia Annalee Bellamy Paola Tinley Violeta Jenesis
Arden Giana Wendy Ellison Florence Margo Naya Robin Sandra Scout Waverly Janessa
Jayden Micah Novah Zora Ann Jana Taliyah Vada Giavanna Ingrid Valery Azaria
Emmarie Esperanza Kailyn Aiyana Keilani Austyn Whitley Elina Kimora Maliah
);

my %exclude = ();

my $count = shift (@ARGV);

unless ($count && $count+0 > 0 && $count+0 < 20) {
	$count = 5;	
}

my @boys = (shuffle(@boy_names))[0..$count-1];
my @girls = (shuffle(@girl_names))[0..$count-1];
my @family = (shuffle(@surnames))[0..2*$count];

say $_, " ", shift @family for (@boys, @girls);

# Sources:
# https://names.mongabay.com/most_common_surnames.htm
# https://www.verywellfamily.com/top-1000-baby-girl-names-2757832
# https://www.verywellfamily.com/top-1000-baby-boy-names-2757618
