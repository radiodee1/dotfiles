
import { Extension } from 'resource:///org/gnome/shell/extensions/extension.js';
import * as Main from 'resource:///org/gnome/shell/ui/main.js';
import * as PanelMenu from 'resource:///org/gnome/shell/ui/panelMenu.js';
import * as St from 'resource:///org/gnome/shell/widgets/st.js';
import GLib from 'gi://GLib';

export default class CommandToBarExtension extends Extension {
    enable() {
        this._button = new PanelMenu.Button(0.0, this.metadata.name, false);
        this._label = new St.Label({
            text: 'Loading...',
            y_align: St.Align.MIDDLE
        });
        this._button.add_child(this._label);
        Main.panel.addToStatusArea(this.metadata.uuid, this._button);

        // Update every 30 seconds
        this._timeout = GLib.timeout_add_seconds(GLib.PRIORITY_DEFAULT, 30, () => {
            this._updateLabel();
            return GLib.SOURCE_CONTINUE;
        });
        this._updateLabel(); // Initial call
    }

    _updateLabel() {
        // --- CHANGE YOUR COMMAND HERE ---
        let command = 'YOUR_COMMAND_HERE';
        
        try {
            let [res, out, err, status] = GLib.spawn_command_line_sync(command);
            if (res) {
                this._label.set_text(new TextDecoder().decode(out).trim());
            } else {
                this._label.set_text('Error');
            }
        } catch (e) {
            this._label.set_text('Error');
        }
    }

    disable() {
        GLib.source_remove(this._timeout);
        this._button.destroy();
        this._button = null;
    }
}
