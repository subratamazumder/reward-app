import React from "react";
import Container from "react-bootstrap/Container";
import Jumbotron from "react-bootstrap/Jumbotron";
function Header() {
  return (
    <div className="text-white text-center">
      <Jumbotron fluid className="bg-info">
        <Container>
          <h2>SC Paul Price Calculator</h2>
          {/* <p>Tap on below options</p> */}
        </Container>
      </Jumbotron>
    </div>
  );
}

export default Header;
