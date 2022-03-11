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
        <BaseButton cta="Request Contact" :onClick="create" />
      </div>
    </form>

    <div v-show="this.contacts.length > 0">
      <h3>Contacts</h3>
      <ul>
        <li v-for="contact in contacts" :key="contact.id">
          You have been friends with {{ contact.email }} since {{ formatDate(contact.updated_at) }}.
          <button>Remove Contact</button>
        </li>
      </ul>
    </div>

    <div v-show="this.inboundContacts.length > 0">
      <h3>Pending Inbound Requests</h3>
      <ul>
        <li v-for="contact in this.inboundContacts" :key="contact.id">
          A user with email {{ contact.email }} has requested that you make contact. 
          They have been waiting for your response since {{ formatDate(contact.updated_at) }}.
          <button>Accept Request</button>
          <button>Decline Request</button>
        </li>
      </ul>
    </div>

    <div v-show="this.outboundContacts.length > 0">
      <h3>Pending Outbound Requests</h3>
      <ul>
        <li v-for="contact in outboundContacts" :key="contact.id">
          You requested {{ contact.email }}. Waiting on a response since {{ formatDate(contact.updated_at) }}.
          <button @click="deleteRequest(contact['email'])">Delete Request</button>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import BaseButton from 'components/base/BaseButton'
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
        }
      };
    },
    components: {
      BaseButton,
    },
    methods: {
      create() {
        const fromUid = JSON.parse(this.$cookie.get('session'))['user']['id'];
        this.$http.get(`/make_connection?fromUid=${fromUid}&email=${this.form.email}`)
          .then(response => {
            this.outboundContacts.push(response.data);
            this.success = 'Request sent';
            this.error = '';
          })
          .catch(error => {
            if (error.response) {
              this.error = error.response.data.error || 'Internal server error: Unknown';
            } else {
              this.error = 'Internal server error: unknown';
            }
          });
      },
      deleteRequest(email) {
        const fromUid = JSON.parse(this.$cookie.get('session'))['user']['id'];
        this.$http.get(`/delete_connection?fromUid=${fromUid}&email=${email}`)
          .then(response => {
            this.success = 'Outbound request deleted';
            this.error = '';
          })
          .catch(error => {
            if (error.response) {
              this.error = error.response.data.error;
            } else {
              this.error = 'Internal server error: unknown';
            }
          });
      },
      clearError() {
        this.error = '';
      },
      clearSuccess() {
        this.success = '';
      },
      formatDate(date) {
        return date.split('T')[0];
      }
    },
    beforeCreate() {
      this.$http.get(`/connections?token=${this.$cookie.get('session')}`, { })
        .then(response => {
          var contacts = response.data;
          for (var i = 0; i < contacts.length; i += 1) {
            if (contacts[i].accepted) {
              this.contacts.push(contacts[i]);
            } else {
              const currentUid = JSON.parse(this.$cookie.get('session'))['user']['id'];
              if (currentUid === contacts[i].user_id_1) {
                this.outboundContacts.push(contacts[i]);
              } else {
                this.inboundContacts.push(contacts[i]);
              }
            }
          }
        })
      .catch(error => console.log(error));
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
