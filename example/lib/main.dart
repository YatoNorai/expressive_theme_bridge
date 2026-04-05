import 'package:expressive_theme_bridge/expressive_theme_bridge.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DemoApp());
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  late final ExpressiveThemeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ExpressiveThemeController()..initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpressiveThemeScope(
      controller: _controller,
      child: ExpressiveThemeBuilder(
        controller: _controller,
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: snapshot.lightTheme,
            darkTheme: snapshot.darkTheme,
            themeMode: ThemeMode.system,
            home: DemoHome(controller: _controller, snapshot: snapshot),
          );
        },
      ),
    );
  }
}

class DemoHome extends StatefulWidget {
  const DemoHome({
    super.key,
    required this.controller,
    required this.snapshot,
  });

  final ExpressiveThemeController controller;
  final ExpressiveThemeSnapshot snapshot;

  @override
  State<DemoHome> createState() => _DemoHomeState();
}

class _DemoHomeState extends State<DemoHome> {
  bool _checked = true;
  bool _switchValue = true;
  int _radio = 1;
  final TextEditingController _textController = TextEditingController(text: 'Material You + Expressive');
  final GlobalKey<ScaffoldMessengerState> _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('SnackBar gerado pelo tema nativo')), 
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final tokens = theme.extension<ExpressiveThemeTokens>() ?? ExpressiveThemeTokens.defaults();

    return ScaffoldMessenger(
      key: _messengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('expressive_theme_bridge'),
          actions: [
            IconButton(
              tooltip: 'Refresh theme',
              onPressed: () => widget.controller.refreshTheme(),
              icon: const Icon(Icons.refresh),
            ),
            Switch.adaptive(
              value: widget.controller.isMaterialYouEnabled,
              onChanged: (value) async {
                if (value) {
                  await widget.controller.enableMaterialYou();
                } else {
                  await widget.controller.disableMaterialYou();
                }
                if (mounted) setState(() {});
              },
            ),
          ],
        ),
        floatingActionButton: Tooltip(
          message: 'FloatingActionButton',
          child: FloatingActionButton(
            onPressed: () => _showSnackBar(context),
            child: const Icon(Icons.add),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: 0,
          onDestinationSelected: (_) {},
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.palette_outlined), selectedIcon: Icon(Icons.palette), label: 'Theme'),
            NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(tokens.spacing16),
          children: [
            _HeroCard(snapshot: widget.snapshot),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () => _showSnackBar(context),
                  child: const Text('ElevatedButton'),
                ),
                FilledButton(
                  onPressed: () => showDialog<void>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Dialog'),
                      content: const Text('Este dialog usa os estilos do tema nativo.'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Fechar')),
                      ],
                    ),
                  ),
                  child: const Text('FilledButton'),
                ),
                OutlinedButton(
                  onPressed: () => showModalBottomSheet<void>(
                    context: context,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ListTile(
                            leading: Icon(Icons.layers_outlined),
                            title: Text('BottomSheet'),
                            subtitle: Text('Aparência coerente com Material 3 Expressive.'),
                          ),
                          const SizedBox(height: 12),
                          FilledButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Fechar'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: const Text('OutlinedButton'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: EdgeInsets.all(tokens.spacing16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Preview de tipografia', style: theme.textTheme.titleLarge),
                    const SizedBox(height: 8),
                    Text('Display Large', style: theme.textTheme.displayLarge),
                    Text('Headline Medium', style: theme.textTheme.headlineMedium),
                    Text('Title Large', style: theme.textTheme.titleLarge),
                    Text('Body Medium com hierarquia clara.', style: theme.textTheme.bodyMedium),
                    Text('Label Small', style: theme.textTheme.labelSmall),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: EdgeInsets.all(tokens.spacing16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Componentes', style: theme.textTheme.titleLarge),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        labelText: 'TextField',
                        hintText: 'Digite algo',
                        prefixIcon: Icon(Icons.edit_outlined),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SwitchListTile(
                      value: _switchValue,
                      onChanged: (v) => setState(() => _switchValue = v),
                      title: const Text('Switch'),
                      subtitle: const Text('Controle visual com tema nativo.'),
                    ),
                    CheckboxListTile(
                      value: _checked,
                      onChanged: (v) => setState(() => _checked = v ?? false),
                      title: const Text('Checkbox'),
                    ),
                    RadioListTile<int>(
                      value: 1,
                      groupValue: _radio,
                      onChanged: (v) => setState(() => _radio = v ?? 1),
                      title: const Text('Radio 1'),
                    ),
                    RadioListTile<int>(
                      value: 2,
                      groupValue: _radio,
                      onChanged: (v) => setState(() => _radio = v ?? 2),
                      title: const Text('Radio 2'),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        Chip(label: const Text('Chip')),
                        InputChip(label: const Text('InputChip'), onPressed: () {}),
                        FilterChip(label: const Text('FilterChip'), selected: true, onSelected: (_) {}),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const LinearProgressIndicator(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Cards com fundo e contraste do tema atual', style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            ...List.generate(
              4,
              (index) => Card(
                child: Row(
                  children: [
                 CircleAvatar(
                                  /*       backgroundColor: cs.primaryContainer,
                        foregroundColor: cs.onPrimaryContainer, */
                        child: Icon(index.isEven ? Icons.widgets : Icons.color_lens),
                      ),
                       Text('Card ${index + 1}'),
                     const Text('Título, subtítulo, ícone, bordas e elevação expressivos.'),
                     const Icon(Icons.chevron_right),
                    
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 10,
              shadowColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.all(tokens.spacing16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tokens visuais principais', style: theme.textTheme.titleLarge),
                    const SizedBox(height: 12),
                    _TokenRow(label: 'Primary', color: cs.primary),
                    _TokenRow(label: 'Primary Container', color: cs.primaryContainer),
                    _TokenRow(label: 'Surface', color: cs.surface),
                    _TokenRow(label: 'Surface Container', color: cs.surfaceContainer),
                    _TokenRow(label: 'Outline', color: cs.outline),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.snapshot});

  final ExpressiveThemeSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Card(
      color: cs.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: cs.primary,
              foregroundColor: cs.onPrimary,
              child: Icon(snapshot.isMaterialYouEnabled ? Icons.auto_awesome : Icons.palette_outlined),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snapshot.isMaterialYouEnabled ? 'Material You ativo' : 'Material You desativado',
                    style: theme.textTheme.titleLarge?.copyWith(color: cs.onPrimaryContainer),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    snapshot.isDynamicColorSupported
                        ? 'Dynamic color suportado neste dispositivo.'
                        : 'Dynamic color não disponível; o fallback seed color está em uso.',
                    style: theme.textTheme.bodyMedium?.copyWith(color: cs.onPrimaryContainer),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TokenRow extends StatelessWidget {
  const _TokenRow({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final on = ThemeData.estimateBrightnessForColor(color) == Brightness.dark ? Colors.white : Colors.black;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(width: 24, height: 24, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8))),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
          Text('#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}', style: TextStyle(color: on)),
        ],
      ),
    );
  }
}
