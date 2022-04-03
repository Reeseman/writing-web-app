<template>
  <div id="Contacts.vue">
    <p v-show="error.length > 0" class="error">
      {{ error }}
    </p>
    <p v-show="success.length > 0" class="success">
      {{ success }}
    </p>
    <h3>Add New Contact</h3>
    <form>
      <input
        v-model="form.email"
        type="text"
        placeholder="Email"
        @change="clearError"
      >
      <div style="display: inline-block; width: 200px;">
        <BaseButton cta="Request Contact" :onClick="sendConnectionRequest" />
      </div>
    </form>

    <div v-show="this.contacts.length > 0">
      <h3>Contacts</h3>
      <ul>
        <li v-for="contact in contacts" :key="contact.id">
          You have been friends with {{ contact.email }} since {{ formatDate(contact.updated_at) }}.
          <button @click="deleteContactRequest(contact['user_id_1'], contact['user_id_2'])">Remove Contact</button>
        </li>
      </ul>
    </div>

    <div v-show="this.inboundContacts.length > 0">
      <h3>Pending Inbound Requests</h3>
      <ul>
        <li v-for="contact in this.inboundContacts" :key="contact.id">
          A user with email {{ contact.email }} has requested that you make contact.
          They have been waiting for your response since {{ formatDate(contact.updated_at) }}.
          <button @click="acceptInboundRequest(contact['user_id_1'], contact['user_id_2'])">Accept Request</button>
          <button @click="declineRequest(contact['user_id_1'], contact['user_id_2'])">Decline Request</button>
        </li>
      </ul>
    </div>

    <div v-show="this.outboundContacts.length > 0">
      <h3>Pending Outbound Requests</h3>
      <ul>
        <li v-for="contact in outboundContacts" :key="contact.id">
          You requested {{ contact.email }} on {{ formatDate(contact.updated_at) }}. Awaiting response.
          <button @click="deleteOutboundRequest(contact['user_id_1'], contact['user_id_2'])">Delete Request</button>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import BaseButton from 'components/base/BaseButton';
  import connectionsMixin from 'lib/api/connections';
  import delayMixin from 'lib/api/delay';
  export default {
    name: 'Contacts',
    data: function() {
      return {
        inboundContacts: [],
        contacts: [],
        outboundContacts: [],
        error: '',
        success: '',
        form: {
          'email': '',
        },
        fromUid: null,
      };
    },
    components: {
      BaseButton,
    },
    beforeCreate() {
      this.fromUid = JSON.parse(this.$cookie.get('session'))['user']['id'];
    }
    created() {
      this.refreshConnections();
    },
    methods: {
      sendConnectionRequest() {
        this.makeNewConnection(this.fromUid, this.form.email, this.newConnectionResponse, this.newConnectionError);
      },
      newConnectionResponse(response) {
        this.outboundContacts.push(response.data);
        this.success = 'Request sent';
        this.error = '';
      },
      acceptInboundRequest(uid1, uid2) {
        this.acceptInboundConnectionRequest(uid1, uid2, this.acceptInboundRequestHandler);
        this.refreshConnectionsSlowly();
      },
      acceptInboundRequestHandler(response) {
        this.success = 'Request accepted.';
        this.error = '';
      },
      deleteOutboundRequest(uid1, uid2) {
        this.deleteRequest(uid1, uid2, 'Outbound request deleted.');
      },
      deleteContactRequest(uid1, uid2) {
        this.deleteRequest(uid1, uid2, 'Contact deleted.');
      },
      declineRequest(uid1, uid2) {
        this.deleteRequest(uid1, uid2, 'Request declined.');
      },
      deleteRequest(uid1, uid2, successMessage) {
        this.deleteAnyContactRequest(uid1, uid2, successMessage, this.deleteRequestCallback);
      },
      deleteRequestCallback(msg) {
        this.success = msg;
        this.error = '';
        this.refreshConnectionsSlowly();
      },
      clearError() {
        this.error = '';
      },
      formatDate(date) {
        return date.split('T')[0];
      },
      refreshConnectionsSlowly() {
        this.delay(150).then(this.refreshConnections);
      },
      refreshConnections() {
        this.getConnections(this.fromUid, this.refreshConnectionsHandler);
      },
      refreshConnectionsHandler(response) {
        let acceptedContacts = [];
        let outboundContacts = [];
        let inboundContacts = [];
        const contacts = response.data;
        for (let i = 0; i < contacts.length; i += 1) {
          if (contacts[i].accepted) {
            acceptedContacts.push(contacts[i]);
          } else {
            if (this.fromUid === contacts[i].user_id_1) {
              outboundContacts.push(contacts[i]);
            } else {
              inboundContacts.push(contacts[i]);
            }
          }
        }
        this.contacts = acceptedContacts;
        this.inboundContacts = inboundContacts;
        this.outboundContacts = outboundContacts;
      },
    },
  };
</script>

<style lang="scss" scoped>
  @import 'application.scss';
  form > input {
      -webkit-border-radius: 3px;
      -moz-border-radius: 3px;
      border-radius: 3px;
      font-family: Arial;
      font-size: 15px;
      line-height: 20px;
      width: 250px;
      padding: 10px;
      background-color: $whiteSpace;
      border: solid $darkOrange 1px;
      text-decoration: none;
      display: inline-block;
  }

  form > input:focus {
      border: solid $darkOrange 1px !important;
      outline-offset: 0px !important;
      outline: none !important;
  }

  .error {
    color: $darkOrange;
  }

  .success {
    color: $medBlue;
  }
</style>
