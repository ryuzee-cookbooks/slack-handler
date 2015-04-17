slack-handler Cookbook
======================
This cookbook makes enable to notify exception or errors to slack

Requirements
------------
You need to set up Slack properly such as generating token.

Attributes
----------
#### slack-handler::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['slack-handler']['slack_webhook_url']</tt></td>
    <td>String</td>
    <td>API endpoint</td>
    <td><tt>https://hooks.slack.com/services/T012345678/B01234567/AbcDeFGHijKLMnOPQrstuvWX</tt></td>
  </tr>
  <tr>
    <td><tt>['slack-handler']['channel']</tt></td>
    <td>String</td>
    <td>channel name that is the destination</td>
    <td><tt>#chef</tt></td>
  </tr>
  <tr>
    <td><tt>['slack-handler']['username']</tt></td>
    <td>String</td>
    <td>Username when posting to slack</td>
    <td><tt>chef</tt></td>
  </tr>
  <tr>
    <td><tt>['slack-handler']['user_emoji']</tt></td>
    <td>String</td>
    <td>Emoji of the user</td>
    <td><tt>:chef:</tt></td>
  </tr>
</table>

Usage
-----
#### slack-handler::default
Just include `slack-handler` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[slack-handler]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Ryutaro YOSHIBA
License: MIT License
