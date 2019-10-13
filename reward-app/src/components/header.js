import React from "react";
import Container from "react-bootstrap/Container";
import Jumbotron from "react-bootstrap/Jumbotron";
function Header() {
  return (
    <div className="text-white text-center">
      <Jumbotron fluid className="bg-info">
        <Container>
          <h1>SCP Reward Manger</h1>
          <p>Tap on below options</p>
        </Container>
      </Jumbotron>
    </div>
  );
}

export default Header;
