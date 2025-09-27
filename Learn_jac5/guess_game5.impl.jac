

# Walker Implementation for starting the game
impl GuessGame.start {
    # If no turn node exists yet, create one with a random number
    if not [root --> (`?turn)] {
        next = root ++> turn(random.randint(1, 10));
    } else {
        # Othewise, reuse the existing turn
        next = [root --> (`?turn)];
    }
    print ("Walker started with guess=", self.guess);

    # Move the walker to the turn node
    visit next;
}

# Walker implementation  for processing a guess
impl GuessGame.process_guess {
    if [-->] {
        visit [-->];
    } else {
        if self.guess < here.correct_number {
            print("Too Low!");
            here ++> turn(here.correct_number);
        } elif self.guess > here.correct_number {
            print("Too High!");
            here ++> turn(here.correct_number);
        } else {
            print("Congratulations! You guessed correctly.");
            disengage;
        }
    }

}

