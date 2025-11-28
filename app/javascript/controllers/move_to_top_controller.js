import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

// Connects to data-controller="move-to-top"
export default class extends Controller {
  connect() {
    console.log("hi");
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatChannel", user_id: this.idValue },
      { received: (data) => this.renderPartial(data) }
    );
  }
}
