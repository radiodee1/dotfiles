import { Extension } from 'resource:///org/gnome/shell/extensions/extension.js';
import * as PanelMenu from 'resource:///org/gnome/shell/ui/panelMenu.js';
import * as Main from 'resource:///org/gnome/shell/ui/main.js';
import * as Clutter from 'gi://Clutter';
import  GLib from 'gi://GLib';
import  Gio from 'gi://Gio';
import  St from 'gi://St';

export default class CommandToPanelExtension extends Extension {
    enable() {
        this._indicator = new PanelMenu.Button(0.0, this.metadata.name, false);
        this._label = new St.Label({
            text: 'Loading...',
            y_align: 2// Clutter.ActorAlign.CENTER
        });
        this._indicator.add_child(this._label);
        Main.panel.addToStatusArea(this.metadata.uuid, this._indicator);

        this._homedir = GLib.get_home_dir() + '/.local/share/gnome-shell/extensions/text-to-bar@dliebman.com/';
        // Command to run (e.g., get date)
        this._command = [ this._homedir + '/script.sh'];
        
        // Start the timer
        this._timeoutId = GLib.timeout_add_seconds(GLib.PRIORITY_DEFAULT, 30, () => {
            this._updateLabel();
            return true; // Keep the timer alive
        });
        
        // Initial call
        this._updateLabel();
    }

    _updateLabel() {
        try {
            // Run command asynchronously
            let proc = new Gio.Subprocess({
                argv: this._command,
                flags: Gio.SubprocessFlags.STDOUT_PIPE
            });
            proc.init(null);
            proc.communicate_utf8_async(null, null, (proc, res) => {
                let [, stdout] = proc.communicate_utf8_finish(res);
                this._label.set_text(stdout.trim());
            });
        } catch (e) {
            this._label.set_text('Error');
            console.error(e);
        }
    }

    disable() {
        if (this._timeoutId) {
            GLib.source_remove(this._timeoutId);
            this._timeoutId = 0;
        }
        this._indicator.destroy();
        this._indicator = null;
        this._label = null;
    }
}

