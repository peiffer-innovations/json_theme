import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';

class ExampleForm extends StatefulWidget {
  const ExampleForm({
    super.key,
  });

  @override
  State createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  String? _countryValue;
  bool? _phoneNumberMobile;
  String? _radioValue;

  @override
  void initState() {
    super.initState();

    _phoneNumberMobile = false;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();

    super.dispose();
  }

  void _validate() {
    if (_formKey.currentState?.validate() != true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please correct form errors'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                      ),
                      validator: (value) => Validator(validators: [
                        const RequiredValidator(),
                      ]).validate(
                        label: 'First Name',
                        value: value,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Flexible(
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                      ),
                      validator: (value) => Validator(validators: [
                        const RequiredValidator(),
                      ]).validate(
                        label: 'Last Name',
                        value: value,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'example@example.com',
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => Validator(validators: [
                  const RequiredValidator(),
                  const EmailValidator(),
                ]).validate(
                  label: 'Email',
                  value: value,
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) => Validator(validators: [
                  const RequiredValidator(),
                  const PhoneNumberValidator(),
                ]).validate(
                  label: 'Phone Number',
                  value: value,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    onChanged: (value) =>
                        setState(() => _phoneNumberMobile = value),
                    value: _phoneNumberMobile,
                  ),
                  const Flexible(child: Text('Mobile')),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          autocorrect: false,
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            errorMaxLines: 1,
                            labelText: 'Password',
                          ),
                          obscureText: true,
                          validator: (value) => Validator(validators: [
                            const RequiredValidator(),
                            const MinLengthValidator(length: 8)
                          ]).validate(
                            label: 'Password',
                            value: value,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Flexible(
                    child: TextFormField(
                      autocorrect: false,
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                      ),
                      obscureText: true,
                      validator: (value) => Validator(validators: [
                        const RequiredValidator(),
                        _CustomValidator(
                          (value) => _passwordController.text ==
                                  _confirmPasswordController.text
                              ? null
                              : 'Password fields do not match',
                        ),
                      ]).validate(
                        label: 'Password',
                        value: value,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: null,
                decoration: const InputDecoration(
                  hintText: 'Enter your comments...',
                  labelText: 'Comments',
                ),
                maxLength: 200,
                maxLines: 5,
                validator: (value) => Validator(
                        validators: [const MinLengthValidator(length: 10)])
                    .validate(
                  label: 'Comments',
                  value: value,
                ),
              ),
              const SizedBox(height: 16.0),
              DropdownButton<String>(
                hint: const Text('Country'),
                items: _createCountryList().map((String str) {
                  return DropdownMenuItem(
                    value: str,
                    child: Text(
                      str,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => _countryValue = value);
                },
                value: _countryValue,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Radio(
                        groupValue: _radioValue,
                        onChanged: (value) =>
                            setState(() => _radioValue = value?.toString()),
                        value: 'one',
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      const Text(
                        'One',
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Radio(
                        groupValue: _radioValue,
                        onChanged: (value) =>
                            setState(() => _radioValue = value?.toString()),
                        value: 'two',
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      const Text(
                        'Two',
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Radio(
                        groupValue: _radioValue,
                        onChanged: (value) =>
                            setState(() => _radioValue = value?.toString()),
                        value: 'three',
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      const Text(
                        'Three',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              DropdownButton<String>(
                hint: const Text('Countries (Disabled)'),
                items: _createCountryList().map((String str) {
                  return DropdownMenuItem(
                    value: str,
                    child: Text(
                      str,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: null,
                value: null,
              ),
              const SizedBox(height: 16.0),
              DropdownButton<String>(
                hint: const Text('Countries (Selected; Disabled)'),
                items: _createCountryList().map((String str) {
                  return DropdownMenuItem(
                    value: str,
                    child: Text(
                      str,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: null,
                value: 'United States of America (USA)',
              ),
              const SizedBox(height: 16.0),
              const SizedBox(height: 16.0),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(
                    onChanged: null,
                    value: true,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Disabled 1',
                  ),
                ],
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(
                    onChanged: null,
                    value: false,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Disabled 2',
                  ),
                ],
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(
                    onChanged: null,
                    value: false,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Disabled 3',
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Radio(
                    groupValue: '1',
                    onChanged: null,
                    value: '1',
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Disabled 1',
                  ),
                ],
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Radio(
                    groupValue: '2',
                    onChanged: null,
                    value: '2',
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Disabled 2',
                  ),
                ],
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Radio(
                    groupValue: '3',
                    onChanged: null,
                    value: '3',
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Disabled 3',
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: null,
                enabled: false,
                decoration: const InputDecoration(
                  hintText: 'Required',
                  labelText: 'Disabled',
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: null,
                decoration: const InputDecoration(
                  hintText: 'Disabled multiline...',
                  labelText: 'Disabled',
                ),
                enabled: false,
                maxLength: 200,
                maxLines: 5,
                validator: (value) => Validator(
                  validators: [const MinLengthValidator(length: 10)],
                ).validate(
                  label: 'Disabled',
                  value: value,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Enabled'),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  const Flexible(
                    child: TextButton(
                      onPressed: null,
                      child: Text('Disabled'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Enabled'),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  const Flexible(
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text('Disabled'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _validate(),
                child: const Text('Validate'),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  List<String> _createCountryList() {
    const str = '''Afghanistan
Albania
Algeria
Andorra
Angola
Anguilla
Antigua & Barbuda
Argentina
Armenia
Australia
Austria
Azerbaijan
Bahamas
Bahrain
Bangladesh
Barbados
Belarus
Belgium
Belize
Benin
Bermuda
Bhutan
Bolivia
Bosnia & Herzegovina
Botswana
Brazil
Brunei Darussalam
Bulgaria
Burkina Faso
Myanmar/Burma
Burundi
Cambodia
Cameroon
Canada
Cape Verde
Cayman Islands
Central African Republic
Chad
Chile
China
Colombia
Comoros
Congo
Costa Rica
Croatia
Cuba
Cyprus
Czech Republic
Democratic Republic of the Congo
Denmark
Djibouti
Dominica
Dominican Republic
Ecuador
Egypt
El Salvador
Equatorial Guinea
Eritrea
Estonia
Ethiopia
Fiji
Finland
France
French Guiana
Gabon
Gambia
Georgia
Germany
Ghana
Great Britain
Greece
Grenada
Guadeloupe
Guatemala
Guinea
Guinea-Bissau
Guyana
Haiti
Honduras
Hungary
Iceland
India
Indonesia
Iran
Iraq
Israel and the Occupied Territories
Italy
Ivory Coast (Cote d'Ivoire)
Jamaica
Japan
Jordan
Kazakhstan
Kenya
Kosovo
Kuwait
Kyrgyz Republic (Kyrgyzstan)
Laos
Latvia
Lebanon
Lesotho
Liberia
Libya
Liechtenstein
Lithuania
Luxembourg
Republic of Macedonia
Madagascar
Malawi
Malaysia
Maldives
Mali
Malta
Martinique
Mauritania
Mauritius
Mayotte
Mexico
Moldova, Republic of
Monaco
Mongolia
Montenegro
Montserrat
Morocco
Mozambique
Namibia
Nepal
Netherlands
Zealand
Nicaragua
Niger
Nigeria
Korea, Democratic Republic of (North Korea)
Norway
Oman
Pacific Islands
Pakistan
Panama
Papua Guinea
Paraguay
Peru
Philippines
Poland
Portugal
Puerto Rico
Qatar
Reunion
Romania
Russian Federation
Rwanda
Saint Kitts and Nevis
Saint Lucia
Saint Vincent's & Grenadines
Samoa
Sao Tome and Principe
Saudi Arabia
Senegal
Serbia
Seychelles
Sierra Leone
Singapore
Slovak Republic (Slovakia)
Slovenia
Solomon Islands
Somalia
South Africa
Korea, Republic of (South Korea)
South Sudan
Spain
Sri Lanka
Sudan
Suriname
Swaziland
Sweden
Switzerland
Syria
Tajikistan
Tanzania
Thailand
Timor Leste
Togo
Trinidad & Tobago
Tunisia
Turkey
Turkmenistan
Turks & Caicos Islands
Uganda
Ukraine
United Arab Emirates
United States of America (USA)
Uruguay
Uzbekistan
Venezuela
Vietnam
Virgin Islands (UK)
Virgin Islands (US)
Yemen
Zambia
Zimbabwe''';

    return str.split('\n').map((String s) => s.trim()).toList();
  }
}

class _CustomValidator extends ValueValidator {
  _CustomValidator(
    this.validator,
  );

  final String? Function(String? value) validator;

  @override
  String get type => 'custom';

  @override
  String? validate({
    required String label,
    String? value,
  }) =>
      validator(value);

  @override
  Map<String, dynamic> toJson() => {};
}
