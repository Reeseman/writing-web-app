<template>
  <div id="NewGame.vue" class="container">
    <!-- <div class="cardContainer">
      <div class="card">
        <span>One Word</span>
      </div>
    </div> -->
    <form>
      <base-title text="Create New Writ" />
      <div class="inputContainer">
        <span>Writ Type: </span>
        <select v-model="form.writType">
          <option value="Poem">Poem</option>
          <option value="Short Story">Short Story</option>
          <option value="Novel">Novel</option>
          <option value="One Word" disabled>One Word (coming soon)</option>
        </select>
      </div>
      <div class="inputContainer">
        <span>Maximum word count per entry: </span>
        <input type="number" v-model="form.maxEntryWordCount" placeholder="Maximum word count per entry" />
      </div>
      <div class="inputContainer">
        <span>Minimum word count per entry: </span>
        <input type="number" v-model="form.minEntryWordCount"  placeholder="Minimum word count per entry"/>
      </div>
      <div class="inputContainer">
        <span>Maximum word count for the entire writ: </span>
        <input type="number" v-model="form.maxTotalWordCount" placeholder="Maximum word count total" />
      </div>
      <div class="inputContainer">
        <span>Minimum word count for the entire writ: </span>
        <input type="number" v-model="form.minTotalWordCount" placeholder="Minimum word count total" />
      </div>
      <div class="inputContainer">
        <span>Select one or more collaborators: </span>
        <multiselect
          v-model="form.collaborators" :options="contacts" :multiple="true"
          placeholder="Type to search" track-by="email" label="email"
        >
          <span slot="noResult">Oops! No elements found. Consider changing the search query.</span>
        </multiselect>
      </div>
      <BaseButton cta="Start Collaboration" :onClick="createWrit" :enabled="isFormFilled()"/>
    </form>
  </div>
</template>

<script>
  import BaseButton from 'components/base/BaseButton';
  import BaseTitle from 'components/base/BaseTitle';
  import connectionsMixin from 'lib/api/connections';
  import Multiselect from 'vue-multiselect';

  export default {
    name: 'NewGame',
    data: function() {
      return {
        uid: '',
        form: {
          writType: 'Poem',
          collaborators: [],
          maxEntryWordCount: 40,
          minEntryWordCount: 1,
          maxTotalWordCount: 100,
          minTotalWordCount: 2,
        },
        contacts: [],
      }
    },
    components: {
      BaseButton,
      BaseTitle,
      Multiselect,
    },
    created() {
      this.uid = JSON.parse(this.$cookie.get('session'))['user']['id'];
      this.getContacts();
    },
    methods: {
      isFormFilled() {
        return this.form.collaborators.length > 0 && this.form.maxEntryWordCount > 0
          && this.form.minEntryWordCount > 0 && this.form.maxTotalWordCount > 0
          && this.form.maxTotalWordCount > 0 && this.form.minTotalWordCount > 0;
      },
      createWrit() {
      },
      getContacts() {
        this.getConnections(this.uid, this.getContactsHandler);
      },
      getContactsHandler(response) {
        let myContacts = [];
        const contacts = response.data;
        for (let i = 0; i < contacts.length; i += 1) {
          if (contacts[i].accepted) {
            myContacts.push({ email: contacts[i].email });
          }
        }
        this.contacts = myContacts;
      },
    }
  };
</script>

<style lang="scss" scoped>
  @import 'application.scss';

  .container {
    background-color: $medBlue;
    overflow: hidden;
    position: absolute;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center; /*centers items on the line (the x-axis by default)*/
    align-items: center; /*centers items on the cross-axis (y by default)*/

    form {
      max-width: 1000px;
      min-width: 500px;
      border: 1px solid $darkOrange;
      border-radius: 23px;
      padding: 5px 30px 30px 30px;
      margin-top: 40px;
      margin-right: 160px;
      background-color: $offWhite;

      .inputContainer {
        margin: 16px 0;

        & > span {
          color: $darkestBlue;
        }

        & > input, select {
          margin-top: 5px;
          display: block;
          padding: 8px;
          border: 1px solid $darkBlue;
          border-radius: 4px;
        }
      }

      .inputContainer::v-deep .multiselect {
        color: black;
        .multiselect__tags {
          border: 1px solid   $darkBlue;
          .multiselect__tag {
            background: $darkBlue;

            .multiselect__tag-icon:after {
              color: $offWhite;
            }
          }
        }

        .multiselect__content-wrapper {
          border-top: none;
          border-left: 1px solid $darkBlue;
          border-right: 1px solid $darkBlue;
          border-bottom: 1px solid $darkBlue;
          .multiselect__content {

            .multiselect__element {
              .multiselect__option {
                background: $lightBlue;
              }

              .multiselect__option--highlight, .multiselect__option--highlight:after {
                background: $darkBlue;
              }

              .multiselect__option--selected, .multiselect__option--selected:after {
                background: $lightOrange;
                color: white;
              }

              .multiselect__option--highlight.multiselect__option--selected {
                background: $darkOrange;
                &:after {
                  background: $darkOrange;
                }
              }
            }
          }
        }
      }
    }
  }
</style>
